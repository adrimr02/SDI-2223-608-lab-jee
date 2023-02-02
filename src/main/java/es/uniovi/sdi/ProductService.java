package es.uniovi.sdi;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;

import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public List<Product> getProducts() {
        List<Product> products = new LinkedList<>();
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("bdProducts");
            products.addAll(db.queryByExample(Product.class));
        } finally {
            db.close();
        }
        return products;
    }

    public void setNewProduct(Product newProduct) {
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("bdProducts");
            db.store(newProduct);
        } finally {
            db.close();
        }
    }
}
