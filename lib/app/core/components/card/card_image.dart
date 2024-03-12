part of components_lib;

class CardImage extends StatelessWidget {
  const CardImage.circle({
    Key? key,
    this.image,
    this.size = 26,
    this.isCircle = true,
  }) : super(key: key);

  const CardImage.rectangle({
    Key? key,
    this.image,
    this.size = 26,
    this.isCircle = false,
  }) : super(key: key);

  final String? image;
  final double size;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      imageBuilder: (context, imageProvider) {
        if (image!.toLowerCase().endsWith('.svg')) {
          return isCircle ? _svgCircle(image!) : _svgRectangle(image!);
        } else {
          return isCircle
              ? _imageCircle(imageProvider)
              : _imageRectangle(imageProvider);
        }
      },
      placeholder: (context, url) => CircleAvatar(
        radius: size.r,
        backgroundColor: Colors.white,
        child: const Center(
          child: CupertinoActivityIndicator(color: kPrimaryAccentColor),
        ),
      ),
      errorWidget: (context, url, error) =>
          isCircle ? _circleError : _rectangleError,
    );
  }

  Widget _svgCircle(String svgUrl) {
    return CircleAvatar(
      radius: size.r,
      backgroundColor: kSoftGrey,
      child: SvgPicture.network(
        svgUrl,
        height: size.r,
        width: size.r,
        placeholderBuilder: (BuildContext context) =>
            const CupertinoActivityIndicator(color: kPrimaryAccentColor),
      ),
    );
  }

  Widget _imageCircle(ImageProvider<Object> imageProvider) {
    return CircleAvatar(
      radius: size.r,
      backgroundColor: Colors.blueGrey,
      backgroundImage: imageProvider,
    );
  }

  Widget get _circleError {
    return CircleAvatar(
      radius: size.r,
      backgroundColor: kErrorColor.withOpacity(0.2),
      child: Center(
        child: Icon(
          Icons.error,
          color: kErrorColor,
          size: (size - 6).r,
        ),
      ),
    );
  }

  Widget _svgRectangle(String svgUrl) {
    return SvgPicture.network(
      svgUrl,
      width: size.r,
      height: size.r,
      placeholderBuilder: (BuildContext context) => _rectanglePlaceholder,
    );
  }

  Widget get _rectanglePlaceholder {
    return Container(
      width: size.r,
      height: size.r,
      color: kSoftGrey,
      child: const Center(
        child: CupertinoActivityIndicator(color: kPrimaryAccentColor),
      ),
    );
  }

  Widget _imageRectangle(ImageProvider<Object> imageProvider) {
    return ClipRRect(
      borderRadius: theme.style.borderRadius.allSmall,
      child: Image(
        image: imageProvider,
        width: size.r,
        height: size.r,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget get _rectangleError {
    return Container(
      width: size.r,
      height: size.r,
      decoration: BoxDecoration(
        color: kErrorColor.withOpacity(0.2),
        borderRadius: theme.style.borderRadius.allSmall,
      ),
      child: Center(
        child: Icon(
          Icons.error,
          color: kErrorColor,
          size: (size - 12).r,
        ),
      ),
    );
  }
}
