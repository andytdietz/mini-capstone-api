require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "create as admin" do
    admin_user = User.find_by(admin: true)
    session[:user_id] = admin_user.
      id

    test "index" do
      get "/products.json"
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal Product.count, data.length
    end

    test "create" do
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      assert_response 201
      assert_difference "Product.count", 1 do
        post "/products.json", params: { user_id: User.first.id, supplier_id: Supplier.first.id, name: "test", price: 10, description: "testing a very very very very long description to make sure I hit the minimum character count", supplier: "Microsoft", images: "www.google.com" }
        data = JSON.parse(response.body)
        assert_response 200
        refute_nil data["id"]
        assert_equal "testing a very very very very long description to make sure I hit the minimum character count", data["description"]
      end

      assert_difference "Product.count", 0 do
        post "/products.json", params: {}
        assert_response 422
      end
    end

    test "show" do
      get "/products/#{Product.first.id}.json"
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal ["id", "name", "price", "description", "is_discounted?", "tax", "total", "supplier", "images"], data.keys
    end

    test "update" do
      product = Product.first
      patch "/products/#{product.id}.json", params: { name: "Updated name", description: "testing a very very very very long description to make sure I hit the minimum character count", price: 2, supplier: "Microsoft", images: "www.google.com" }
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal "Updated name", data["name"]
    end

    test "destroy" do
      assert_difference "Product.count", -1 do
        delete "/products/#{Product.first.id}.json"
        assert_response 200
      end
    end
  end
end
