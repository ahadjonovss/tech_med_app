import 'package:flutter/material.dart';

import '../data/models/book_model.dart';
import '../data/repositories/admin/products_repository.dart';

class ProductsViewModel extends ChangeNotifier{

  final ProductsRepository productsRepository;
  ProductsViewModel({required this.productsRepository});

  List<String>? images;
  Book? newBook;

  Stream<List<Book>> listenCategories(String categoryId)=>productsRepository.getCategories(categoryId);

  addBook(Book book)=>productsRepository.addProduct(book: book);

  deleteByDocId(String productId)=>productsRepository.deleteProductByDocId(docId: productId);

  updateCategory(String docId,Book book)=>productsRepository.updateCategory(book: book, docId: docId);

  getProductById(String id)=>productsRepository.getProductByDocId(id);


}