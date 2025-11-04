part of 'imports_parts.dart';

// class ProviderImage extends ImageProvider<T> {
//   final String url;
//   final ImageOptions options;
//
//   const ProviderImage({
//     Key? key,
//     required this.url,
//     required this.options,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return generic_image(
//       image: NetworkImage(url),
//       width: options.width,
//       height: options.height,
//       fit: options.fit,
//       alignment: options.alignment ?? Alignment.center,
//       color: options.color,
//       loadingBuilder: (BuildContext context, Widget child,
//           ImageChunkEvent? loadingProgress) {
//         if (loadingProgress == null) return child;
//         return Center(
//           child: CircularProgressIndicator.adaptive(
//             value: loadingProgress.expectedTotalBytes != null
//                 ? loadingProgress.cumulativeBytesLoaded /
//                     loadingProgress.expectedTotalBytes!
//                 : null,
//           ),
//         );
//       },
//       errorBuilder:
//           (BuildContext context, Object exception, StackTrace? stackTrace) {
//         return Center(
//           child: Icon(
//             Icons.error,
//             color: Colors.red,
//             size: 40,
//           ),
//         );
//       },
//
//       // errorBuilder: options.errorBuilder,
//     );
//   }
//
//   @override
//   Future obtainKey(ImageConfiguration configuration) {
//      return SynchronousFuture<T>(null);
//   }
// }
