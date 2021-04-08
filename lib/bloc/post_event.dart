abstract class PostEvent{}

class FetchPostsEvent extends PostEvent{}
class FetchSpecialPostEvent extends PostEvent{}
class UpdatePostEvent extends PostEvent{}
class DeletePostEvent extends PostEvent{}