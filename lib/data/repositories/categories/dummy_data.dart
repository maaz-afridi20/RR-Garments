import 'package:coding_with_t_ecommerce2/data/models/address_model.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TDummyData {
  //! Banners
  // static final List<BannerModel> banner = [
  //   BannerModel(
  //       imageUrl: TImages.promoBanner1,
  //       targetScreen: TRoutes.order,
  //       active: false),
  // ];

  //! users

  static final UserModel user = UserModel(
      email: 'maazarfidi.ma47@gmail.com',
      firstName: 'maaz',
      lastName: 'khan',
      userName: 'M-K',
      phoneNumber: '+923121915579',
      addresses: [
        AddressModel(
            id: '1',
            name: 'Codint With T',
            phoneNumber: '923121915579',
            street: 'razgir banda billitang',
            city: 'kohat',
            state: 'kpk',
            postalCode: '26000',
            country: 'pakistan'),
      ],
      profilePicture: TImages.userImage);

  //! cart model

  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variantId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
          productId: '002',
          variantId: '',
          quantity: 2,
          title: products[0].title,
          image: products[0].thumbnail,
          brandName: products[0].brand!.name,
          price: products[0].productVariations![0].price,
          selectedVariation: products[0].productVariations![0].attributeValues),
    ],
  );

  //! orders model
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 259,
      orderDate: DateTime(2024, 01, 01),
      deliveryDate: DateTime(2024, 01, 10),
    ),
    OrderModel(
      id: 'CWT1432',
      status: OrderStatus.shipped,
      items: cart.items,
      totalAmount: 599,
      orderDate: DateTime(2024, 01, 01),
      deliveryDate: DateTime(2024, 01, 10),
    ),
  ];

  //! all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelary',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    //! sub categories
    CategoryModel(
        id: '8',
        name: 'Sports Shoes',
        image: TImages.sportIcon,
        isFeatured: true,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track Suit',
        image: TImages.sportIcon,
        isFeatured: true,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports Equipment',
        image: TImages.sportIcon,
        isFeatured: true,
        parentId: '1'),

    //! Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Kitchen Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true,
        parentId: '5'),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true,
        parentId: '5'),

    //! electronics
    CategoryModel(
        id: '15',
        name: 'Laptops',
        image: TImages.electronicIcon,
        isFeatured: true,
        parentId: '2'),
    CategoryModel(
        id: '16',
        name: 'Mobiles',
        image: TImages.electronicIcon,
        isFeatured: true,
        parentId: '2'),

    CategoryModel(
        id: '17',
        name: 'Clothes',
        image: TImages.clothIcon,
        isFeatured: true,
        parentId: '3'),
  ];
}
