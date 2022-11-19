import 'package:shamo_app/data/models/gallery_model.dart';
import 'package:shamo_app/data/models/product_model.dart';

const testGalleryModel = GalleryModel(
  id: 1,
  productsId: 1,
  url: "url",
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testGalleryModelList = [testGalleryModel];

const testProductJson = {
  "id": 1,
  "name": 'name',
  "price": 1,
  "description": 'description',
  "tags": 'tags',
  "categories_id": 1,
  "galleries": [
    {
      "id": 1,
      "products_id": 1,
      "url": "url",
      "created_at": "created_at",
      "updated_at": "updated_at",
    }
  ],
  "created_at": 'created_at',
  "updated_at": 'updated_at',
};

const testProductModel = ProductModel(
  id: 1,
  name: 'name',
  price: 1,
  description: 'description',
  tags: 'tags',
  categoriesId: 1,
  galleries: testGalleryModelList,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
);

const testProductModelList = [testProductModel];
