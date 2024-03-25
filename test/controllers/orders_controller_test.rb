require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password")
    @order = Order.create(user_id: @user.id, product_id: Product.first.id, quantity: 10, subtotal: 10, tax: 10, total: 20)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/orders.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal @user.orders.count, data.length
  end

  test "create" do
    assert_difference "Order.count", 1 do
      post "/orders.json",
        params: { user_id: User.first, product_id: Product.first.id, quantity: 10, subtotal: 10, tax: 10, total: 20 },
        headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "show" do
    get "/orders/#{@order.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_name", "product", "quantity", "total"], data.keys
  end
end
