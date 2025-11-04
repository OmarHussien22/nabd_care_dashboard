part of 'imports_parts.dart';


// import 'package:delta/src/Shared/Presentation/Widgets/GeneralWidgets/Text/imports_text.dart';
// import 'package:flutter/material.dart';
//
// class ImageZoom extends StatefulWidget {
//   final List images;
//   final String? heroTag;
//   final String? imgUrl;
//
//   const ImageZoom({required this.images, this.heroTag, this.imgUrl});
//   @override
//   _ImageZoomState createState() => _ImageZoomState();
// }
//
// class _ImageZoomState extends State<ImageZoom> {
//
//   var _current;
//   final ValueNotifier _notifier=new ValueNotifier<int>(0);
//   late PageController _controller ;
//
//
//   @override
//   void initState() {
//     // _controller=new PageController(initialPage: 0);
//     // _current= widget.images.first;
//     _controller = new PageController(initialPage: 0);
//     _current =widget.imgUrl != null ? 1: widget.images.first;
//     super.initState();
//   }
//
//   _setChangeImage(index){
//     _current=widget.images[index];
//     _notifier.value=index;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black87,
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           elevation: 0,
//           title: CustomText(  'معرض الصور',color: Colors.white ,) ,
//           leading: InkWell(
//             child: Icon(
//               Icons.arrow_back_ios,
//               size: 25,
//               color: Colors.white,
//             ),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         body: Container(
//           child: PhotoViewGallery.builder(
//               pageController: _controller,
//               scrollPhysics: const BouncingScrollPhysics(),
//               itemCount:widget.imgUrl != null ? 1 : widget.images.length,
//               onPageChanged:widget.imgUrl != null ? null:_setChangeImage,
//               scrollDirection: Axis.horizontal,
//               builder: (context, index) => PhotoViewGalleryPageOptions(
//                   imageProvider:widget.imgUrl != null ? NetworkImage(widget.imgUrl??''):NetworkImage(widget.images[index]),
//                   minScale: PhotoViewComputedScale.contained,
//                   maxScale: PhotoViewComputedScale.contained * 4,
//                   heroAttributes: PhotoViewHeroAttributes(tag: widget.heroTag??'')
//               )
//           ),
//         )
//     );
//   }
// }
//
