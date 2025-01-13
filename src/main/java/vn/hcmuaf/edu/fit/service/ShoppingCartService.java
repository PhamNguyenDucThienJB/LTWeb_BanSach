package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.model.ShoppingCartItem;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingCartService implements Serializable {
    private Map<String, ShoppingCartItem> items = null;

    public ShoppingCartService() {
        items = new HashMap<String, ShoppingCartItem>();
    }

    public int getCount() {
        int totalQuantity = 0;
        for (ShoppingCartItem item : items.values()) {
            totalQuantity += item.getSoLgMua(); // Lấy số lượng mua từ mỗi sản phẩm
        }
        return totalQuantity;
    }

    public void addToCart(ProductDetails product, int quantity) {
        String productId = product.getId();
        if (items.containsKey(productId)) {
            // Nếu sản phẩm đã tồn tại, tăng số lượng
            ShoppingCartItem existingItem = items.get(productId);
            existingItem.quantityUp(quantity);
        } else {
            // Nếu sản phẩm chưa có, tạo mới và thêm vào giỏ hàng
            ShoppingCartItem newItem = new ShoppingCartItem(
                    product.getId(), quantity, product, product.getPrice(), null
            );
            items.put(productId, newItem);
        }
    }

    public void removeOne(String productCode) {
        if (items.containsKey(productCode)) {
            ShoppingCartItem item = items.get(productCode);
            int currentQuantity = item.getSoLgMua();

            if (currentQuantity > 1) {
                item.setSoLgMua(currentQuantity - 1);
            } else {
                items.remove(productCode);
            }
        } else {
            System.out.println("Product code " + productCode + " not found in cart.");
        }
    }

    public void remove(String productCode) {
        if (items.containsKey(productCode)) {
            items.remove(productCode); // Xóa sản phẩm khỏi giỏ hàng
            System.out.println("Removed product " + productCode + " from cart.");
        } else {
            System.out.println("Product code " + productCode + " not found in cart.");
        }
    }


    public List<ShoppingCartItem> getCartItems() {
        return new ArrayList<>(items.values());
    }

    public double getTotalPrice() {
        double total = 0;
        for (ShoppingCartItem item : items.values()) {
            total += item.giaSanPhamTrongGioHang();
        }
        return total;
    }

    public ShoppingCartItem getCartItemById(String productId) {
        return items.get(productId); // Trả về sản phẩm hoặc null nếu không tồn tại
    }


}
