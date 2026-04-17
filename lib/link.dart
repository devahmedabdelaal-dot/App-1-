class applink{

static const String server = "http://10.0.2.2/App1";
// static const String server = "http://localhost/App1";
static const String test = "$server/test.php";



//======================== image =========================//

static const String imageStatic ="http://10.0.2.2/App1/images/";


//======================== Auth =========================//


static const String signup = "$server/auth/signup.php";
static const String login = "$server/auth/login.php";

static const String resetpassword = "$server/auth/resetpassword.php";


static const String home = "$server/home.php";



static const String items = "$server/Items/items.php";


//========================== favoritre=====================//



static const String favoriteAdd = "$server/favorite/add.php";
static const String favoriteRemove = "$server/favorite/remove.php";
static const String favoriteData = "$server/favorite/view.php";
static const String favoriteDelete = "$server/favorite/delete.php";

//========================== cart=====================//

static const String cartView = "$server/cart/view.php";
static const String cartAdd = "$server/cart/add.php";
static const String cartDelete = "$server/cart/delete.php";
static const String cartGetitemCount = "$server/cart/getCountItem.php";



//========================== search=====================//

static const String search = "$server/search/search.php";


//========================== coupon=====================//

static const String checkCoupon = "$server/coupon/checkCoupon.php";

//========================== checkout=====================//

static const String checkout = "$server/orders/checkout.php";

//========================== orders=====================//
static const String orderspending = "$server/orders/pending.php";

}