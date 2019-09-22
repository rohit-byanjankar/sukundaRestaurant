<!-- contact -->
<div id="contact">
    <div class="col-md-6 map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.7016628453957!2d144.9693593153176!3d-
        37.773592979759634!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad64348ada4b639%3A0x2b63e65114308d20!2s150
        %20Lygon%20St%2C%20Brunswick%20East%20VIC%203057%2C%20Australia!5e0!3m2!1sen!2snp!4v1568705621004!5m2!1sen!2snp"
                width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
    </div>
    <div class="col-md-6 bg-warning marginTouch">
        <h3 class="title-contact">Reserve a Table</h3>
            <form action="{{route('book')}}" method="post">
                @csrf
                <div class="form-group">
                    <label for="email">Name:</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Date of Reservation:</label>
                    <input type="date" class="form-control" name="date" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Number of People:</label>
                    <input type="number" class="form-control" name="totalPeople" min="0" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Phone Number:</label>
                    <input type="text" class="form-control" name="phoneNo" minlength="7" maxlength="10" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Address:</label>
                    <input type="text" class="form-control" name="address" required>
                </div>
                <button type="submit" class="btn btn-warning center-block">Submit</button>
            </form>
    </div>
    <div class="clearfix bg-warning"></div>
</div>
<!-- //contact -->
<!--footer-->
<div class="footer-grid">
    <div class="container">
        <div class="footer_grid_bottom contact">
            <ul>

                <li>
                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                    <a href="#">{{setting('site.email')}}</a>
                </li>
                <li>
                    <span class="fa fa-phone" aria-hidden="true"></span>
                    <p>{{setting('site.phone_number')}}</p>
                </li>
                <li>
                    <span class="fa fa-map-marker" aria-hidden="true"></span>
                    <p>{{setting('site.address')}}</p>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="footer-cpy text-center">
    <div class="social_banner">
        <ul class="social_list">
            <li>
                <a href="https://www.facebook.com/sukundanepalesecuisine" class="facebook">
                    <span class="fa fa-facebook" style="line-height: 50px" aria-hidden="true"></span>
                </a>
            </li>
        </ul>
    </div>
    <div class="footer-copy">
        <p>Copyright © 2019 Sukunda Cuisine All rights reserved
        </p>
    </div>
</div>
<!--//footer-->