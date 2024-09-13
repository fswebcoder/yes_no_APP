enum FromWho {me, hers}

class MessageEntities{
    final String text;
    final String? imageUrl;
    final FromWho fromWho;

    const MessageEntities({
        required this.text,
        this.imageUrl,
        required this.fromWho
    });

}