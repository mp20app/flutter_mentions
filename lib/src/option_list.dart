part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    this.data,
    this.onTap,
    this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
    this.suggestionListPadding,
    this.suggestionListReverse,
    this.suggestionListInnerPadding,
  });

  final Widget Function(Map<String, dynamic>) suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration suggestionListDecoration;

  final EdgeInsetsGeometry suggestionListPadding;
  final EdgeInsetsGeometry suggestionListInnerPadding;
  final bool suggestionListReverse;

  @override
  Widget build(BuildContext context) {
    final reverse = suggestionListReverse ?? false;
    return data.isNotEmpty
        ? SafeArea(
            child: Padding(
              padding: suggestionListPadding ?? EdgeInsets.all(0),
              child: Container(
                decoration: suggestionListDecoration ??
                    BoxDecoration(color: Colors.white),
                constraints: BoxConstraints(
                  maxHeight: suggestionListHeight,
                  minHeight: 0,
                ),
                child: ListView.builder(
                  padding: suggestionListInnerPadding ?? EdgeInsets.all(0),
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final newindex = reverse ? data.length - 1 - index : index;
                    return GestureDetector(
                      onTap: () {
                        onTap(data[newindex]);
                      },
                      child: suggestionBuilder != null
                          ? suggestionBuilder(data[newindex])
                          : Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                data[newindex]['display'],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
          )
        : Container();
  }
}
