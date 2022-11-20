import 'package:shamo_app/data/models/category_model.dart';
import 'package:shamo_app/data/models/category_response.dart';
import "package:shamo_app/data/models/gallery_model.dart";
import "package:shamo_app/data/models/product_model.dart";
import "package:shamo_app/data/models/product_response.dart";
import 'package:shamo_app/data/models/transaction_item_model.dart';
import 'package:shamo_app/data/models/transaction_model.dart';
import 'package:shamo_app/data/models/transaction_response.dart';
import 'package:shamo_app/data/models/user_model.dart';

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
        "name": "name",
        "deleted_at": "deleted_at",
        "created_at": "created_at",
        "updated_at": "updated_at",
      },
    ]
  }
};

final testCategoryResponse =
    CategoryResponse.fromJson(testCategoryResponseJson).catagoryList;

const testTransactionItemJson = {
  "id": 1,
  "users_id": 1,
  "products_id": 1,
  "transactions_id": 1,
  "quantity": 1,
  "created_at": "created_at",
  "updated_at": "updated_at",
  "product": {
    "id": 1,
    "name": "name",
    "price": 1,
    "description": "description",
    "tags": null,
    "categories_id": 1,
    "galleries": [],
    "created_at": "created_at",
    "updated_at": "updated_at"
  }
};

const testTransactionItemModel = TransactionItemModel(
  id: 1,
  usersId: 1,
  productsId: 1,
  transactionsId: 1,
  quantity: 1,
  product: ProductModel(
    id: 1,
    name: "name",
    price: 1,
    description: "description",
    tags: null,
    categoriesId: 1,
    galleries: [],
    createdAt: "created_at",
    updatedAt: "updated_at",
  ),
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testTransactionItemModelList = [testTransactionItemModel];

const testTransactionJson = {
  "id": 1,
  "users_id": 1,
  "address": "address",
  "total_price": 1,
  "shipping_price": 1,
  "status": "status",
  "payment": "payment",
  "created_at": "created_at",
  "updated_at": "updated_at",
  "items": [
    {
      "id": 1,
      "users_id": 1,
      "products_id": 1,
      "transactions_id": 1,
      "quantity": 1,
      "created_at": "created_at",
      "updated_at": "updated_at",
      "product": {
        "id": 1,
        "name": "name",
        "price": 1,
        "description": "description",
        "tags": null,
        "categories_id": 1,
        "galleries": [],
        "created_at": "created_at",
        "updated_at": "updated_at"
      }
    }
  ]
};

const testTransactionModel = TransactionModel(
  id: 1,
  usersId: 1,
  address: "address",
  totalPrice: 1,
  shippingPrice: 1,
  status: "status",
  payment: "payment",
  items: testTransactionItemModelList,
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testTransactionModelList = [testTransactionModel];

const testTransactionResponseJson = {
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "users_id": 1,
        "address": "address",
        "total_price": 1,
        "shipping_price": 1,
        "status": "status",
        "payment": "payment",
        "deleted_at": null,
        "created_at": "created_at",
        "updated_at": "updated_at",
        "items": [
          {
            "id": 1,
            "users_id": 1,
            "products_id": 1,
            "transactions_id": 1,
            "quantity": 1,
            "created_at": "created_at",
            "updated_at": "updated_at",
            "product": {
              "id": 1,
              "name": "name",
              "price": 1,
              "description": "description",
              "tags": null,
              "categories_id": 1,
              "deleted_at": null,
              "created_at": "created_at",
              "updated_at": "updated_at"
            }
          }
        ]
      }
    ]
  }
};

final testTransactionResponse =
    TransactionResponse.fromJson(testTransactionResponseJson).transactionList;

const testUserLoginJson = {
  "access_token": "access_token",
  "user": {
    "id": 1,
    "name": "name",
    "email": "email",
    "username": "username",
    "roles": "roles",
    "created_at": "created_at",
    "updated_at": "updated_at",
    "profile_photo_url": "profile_photo_url"
  }
};

final testUserLoginModel = UserModel.fromJson(testUserLoginJson);
