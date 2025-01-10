package vn.hcmuaf.edu.fit.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingCart implements Serializable {
    private Map<String, ShoppingCartItem> items = null;

    public ShoppingCart() {
        items = new HashMap<String, ShoppingCartItem>();
    }

    public int getCount() {
        return items.size();
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

    public void removeFromCart(String productId) {
        items.remove(productId);
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


}
