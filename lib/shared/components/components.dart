import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/news_app_secreens/web_view_screen.dart';

Widget mySeparatorBuilder() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context) => GestureDetector(
      onTap: () {
        navigateTo(context, WebViewScreen(url: article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  onError: (exception, stackTrace) {
                    print(
                        'error on finding the image URL: ${article['urlToImage']}, $stackTrace');
                  },
                  image: NetworkImage(
                    '${article['urlToImage'] ?? 'https://t4.ftcdn.net/jpg/00/89/55/15/360_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg'}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget newsScreenBuilder(list, {bool isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return buildArticleItem(list[index], context);
        },
        separatorBuilder: (BuildContext context, int index) {
          return mySeparatorBuilder();
        },
        itemCount: list.length,
      ),
      fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
    );

Widget defaultInputField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  var onSubmit,
  required String label,
  var onChange,
  IconData? prefixIcon,
  IconData? suffixIcon,
  var onTap,
  bool readOnly = false,
  validator,
  var suffixAction,
  bool obscureText = false,
}) =>
    TextFormField(
      onChanged: onChange,
      onTap: onTap,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      obscureText: obscureText ? true : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
            onPressed: suffixAction,
            icon: Icon(
              suffixIcon,
            )),
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
