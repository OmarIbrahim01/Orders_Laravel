@extends('orders.layout')


@section('content')

<!-- page content -->
<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>Contacts Design</h3>
      </div>

      <div class="title_right">
        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button">Go!</button>
            </span>
          </div>
        </div>
      </div>
    </div>

    <div class="clearfix"></div>

    <div class="row">
      <div class="col-md-12">
        <div class="x_panel">
          <div class="x_content">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                <ul class="pagination pagination-split">
                  <li><a href="#">A</a></li>
                  <li><a href="#">B</a></li>
                  <li><a href="#">C</a></li>
                  <li><a href="#">D</a></li>
                  <li><a href="#">E</a></li>
                  <li>...</li>
                  <li><a href="#">W</a></li>
                  <li><a href="#">X</a></li>
                  <li><a href="#">Y</a></li>
                  <li><a href="#">Z</a></li>
                </ul>
              </div>

              <div class="clearfix"></div>


              @foreach($orders as $order)
              <div class="col-md-3 col-sm-3 col-xs-12 profile_details">
                <div class="well profile_view">
                  <div class="col-sm-12">
                    <h4 class="brief"><i>Status: <span class="label label-success"><i class="fa fa-paper-plane"></i> Recived</span></i> <span><img src="/img/egypt_flag.png" width="30" style="float: right; margin-right: 5px;"></span></h4>
                    <div class="left col-xs-7">
                      <h2>Omar Ibrahim</h2>
                      <h2>Date: 2/12/2018</h2>
                      <p><strong>Designer: </strong> Bassem Zakaria </p>
                      <ul class="list-unstyled">
                        <li><strong>Customer: </strong> Ahmed Mahmoud</li>
                      </ul>
                      <p><strong>Remaining: </strong> 2 Days </p>
                      <h2 style="float: left;     margin-bottom: 17px;"><span class="label label-danger"><i class="fa fa-paper-plane"></i> Urgent</span></h2>
                    </div>
                    <div class="right col-xs-5 text-center">
                      <img src="/images/img.jpg" alt="" class="img-circle img-responsive">
                    </div>
                  </div>
                  <div class="col-xs-12 bottom text-center">
                    <div class="col-xs-12 col-sm-6 emphasis">
                      <p class="ratings">
                        <a>4.0</a>
                        <a href="#"><span class="fa fa-star"></span></a>
                        <a href="#"><span class="fa fa-star"></span></a>
                        <a href="#"><span class="fa fa-star"></span></a>
                        <a href="#"><span class="fa fa-star"></span></a>
                        <a href="#"><span class="fa fa-star-o"></span></a>
                      </p>
                    </div>
                    <div class="col-xs-12 col-sm-6 emphasis">
                      <button type="button" class="btn btn-primary btn-xs">
                        <i class="fa fa-user"> </i> View Order
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              @endforeach



              
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /page content -->

@endsection