// Model
import 'package:product/data/models/category_model.dart';
import 'package:product/data/models/category_response.dart';
import 'package:product/data/models/checkout_body_model.dart';
import 'package:product/data/models/checkout_response.dart';
import 'package:product/data/models/gallery_model.dart';
import 'package:product/data/models/product_model.dart';
import 'package:product/data/models/product_response.dart';
import 'package:product/data/models/transaction_item_model.dart';
import 'package:product/data/models/transaction_model.dart';
import 'package:product/data/models/transaction_response.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/entities/checkout_body.dart';
import 'package:product/domain/entities/checkout_item.dart';
import 'package:product/domain/entities/gallery.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/domain/entities/transaction.dart';
import 'package:product/domain/entities/transaction_item.dart';

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
  "category": {
    "id": 1,
    "name": "name",
    "created_at": "created_at",
    "updated_at": "updated_at"
  },
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
  category: testCategoryModel,
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
        "deleted_at": "deleted_at",
        "created_at": "created_at",
        "updated_at": "updated_at",
        "category": {
          "id": 1,
          "name": "name",
          "created_at": "created_at",
          "updated_at": "updated_at"
        },
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
    "category": null,
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
        "category": null,
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

const testCheckoutItemJson = {
  "id": 1,
  "quantity": 1,
};

const testCheckoutItemModel = CheckoutItemModel(id: 1, quantity: 1);

const testCheckoutBodyJson = {
  "address": "address",
  "items": [
    {
      "id": 1,
      "quantity": 1,
    },
  ],
  "status": "status",
  "total_price": 1,
  "shipping_price": 1,
};

const testCheckoutBodyModel = CheckoutBodyModel(
  address: "address",
  items: [testCheckoutItemModel],
  status: "status",
  totalPrice: 1,
  shippingPrice: 1,
);

const testCheckoutJson = {
  "code": 200,
  "status": "status",
  "message": "message",
};

const testCheckoutResponse = CheckoutResponse(
  code: 200,
  status: "status",
  message: "message",
);

// Entity
const testGallery = Gallery(
  id: 1,
  productsId: 1,
  url: "url",
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testProduct = Product(
  id: 1,
  name: "name",
  price: 1,
  description: "description",
  tags: "",
  category: testCategory,
  galleries: [testGallery],
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testCategory = Category(
  id: 1,
  name: "name",
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testTransactionItem = TransactionItem(
  id: 1,
  usersId: 1,
  productsId: 1,
  transactionsId: 1,
  quantity: 1,
  product: testProduct,
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testTransaction = Transaction(
  id: 1,
  usersId: 1,
  address: "address",
  totalPrice: 1,
  shippingPrice: 1,
  status: "status",
  payment: "payment",
  items: [testTransactionItem],
  createdAt: "created_at",
  updatedAt: "updated_at",
);

const testCheckoutItem = CheckoutItem(
  id: 1,
  quantity: 1,
);

const testCheckoutBody = CheckoutBody(
  address: "address",
  items: [testCheckoutItem],
  status: "status",
  totalPrice: 1,
  shippingPrice: 1,
);
