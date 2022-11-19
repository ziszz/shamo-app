import 'package:shamo_app/data/models/category_model.dart';
import 'package:shamo_app/data/models/category_response.dart';
import "package:shamo_app/data/models/gallery_model.dart";
import "package:shamo_app/data/models/product_model.dart";
import "package:shamo_app/data/models/product_response.dart";

const testGalleryJson = {
  "id": 1,
  "products_id": 1,
  "url": "url",
  "created_at": "created_at",
  "updated_at": "updated_at",
};

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
  "name": "name",
  "price": 1,
  "description": "description",
  "tags": null,
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
  "created_at": "created_at",
  "updated_at": "updated_at",
};

const testProductModel = ProductModel(
  id: 1,
  name: "name",
  price: 1,
  description: "description",
  tags: null,
  categoriesId: 1,
  galleries: testGalleryModelList,
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testProductModelList = [testProductModel];

const testProductResponseJson = {
  "data": {
    "data": [
      {
        "id": 1,
        "name": "Name",
        "price": 1,
        "description": "description",
        "tags": "tags",
        "categories_id": 1,
        "deleted_at": "deleted_at",
        "created_at": "created_at",
        "updated_at": "updated_at",
        "galleries": [
          {
            "id": 1,
            "products_id": 1,
            "url": "url",
            "deleted_at": "deleted_at",
            "created_at": "created_at",
            "updated_at": "updated_at"
          }
        ]
      }
    ]
  }
};

final testProductResponse =
    ProductResponse.fromJson(testProductResponseJson).productList;

const testCategoryJson = {
  "id": 1,
  "name": "name",
  "created_at": "created_at",
  "updated_at": "updated_at",
};

const testCategoryModel = CategoryModel(
  id: 1,
  name: "name",
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testCategoryModelList = [testCategoryModel];

const testCategoryResponseJson = {
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "name": "Sport",
        "deleted_at": null,
        "created_at": "2021-04-15T02:15:27.000000Z",
        "updated_at": "2021-04-15T02:15:27.000000Z"
      },
    ]
  }
};

final testCategoryResponse =
    CategoryResponse.fromJson(testCategoryJson).catagoryList;
