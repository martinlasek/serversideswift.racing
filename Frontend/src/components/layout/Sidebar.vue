<template>
  <aside class="sidebar-container">
    <div class="sidebar-header">
      <div class="pull-right pt-lg text-muted hidden"><em class="ion-close-round"></em></div><a href="#" class="sidebar-header-logo"><img src="img/logo.png" data-svg-replace="img/logo.svg" alt="Logo"><span class="sidebar-header-logo-text">Centric</span></a>
    </div>
    <div class="sidebar-content">
      <div class="sidebar-toolbar text-center"><a href=""><img src="img/user/01.jpg" alt="Profile" class="img-circle thumb64"></a>
        <div class="mt">Welcome, Willie Webb</div>
      </div>
      <nav class="sidebar-nav">
        <ul>
          <li class="active"><a href="dashboard.html" class="ripple"><span class="pull-right nav-label"><span class="badge bg-success">2</span></span><span class="nav-icon"><img src="" data-svg-replace="img/icons/aperture.svg" alt="MenuItem" class="hidden"></span><span>Dashboard</span><span class="md-ripple"></span></a></li>
          <li><a href="#" class="ripple"><span class="pull-right nav-caret"><em class="ion-ios-arrow-right"></em></span><span class="pull-right nav-label"></span><span class="nav-icon"><img src="" data-svg-replace="img/icons/connection-bars.svg" alt="MenuItem" class="hidden"></span><span>Charts</span><span class="md-ripple"></span></a>
            <ul class="sidebar-subnav">
              <li><a href="rickshaw.html" class="ripple"><span class="pull-right nav-label"></span><span>Rickshaw</span><span class="md-ripple"></span></a></li>
            </ul>
          </li>
          <li><a href="#" class="ripple"><span class="pull-right nav-caret"><em class="ion-ios-arrow-right"></em></span><span class="pull-right nav-label"></span><span class="nav-icon"><img src="" data-svg-replace="img/icons/clipboard.svg" alt="MenuItem" class="hidden"></span><span>Forms</span><span class="md-ripple"></span></a>
            <ul class="sidebar-subnav">
              <li><a href="forms.classic.html" class="ripple"><span class="pull-right nav-label"></span><span>Classic</span><span class="md-ripple"></span></a></li>
              <li><a href="validation.html" class="ripple"><span class="pull-right nav-label"></span><span>Validation</span><span class="md-ripple"></span></a></li>
            </ul>
          </li>
          <li><a href="#" class="ripple"><span class="pull-right nav-caret"><em class="ion-ios-arrow-right"></em></span><span class="pull-right nav-label"></span><span class="nav-icon"><img src="" data-svg-replace="img/icons/person-stalker.svg" alt="MenuItem" class="hidden"></span><span>User</span><span class="md-ripple"></span></a>
            <ul id="user" class="sidebar-subnav">
              <li><a href="login.html" class="ripple"><span class="pull-right nav-label"></span><span>Login</span><span class="md-ripple"></span></a></li>
              <li><a href="signup.html" class="ripple"><span class="pull-right nav-label"></span><span>Signup</span><span class="md-ripple"></span></a></li>
              <li><a href="lock.html" class="ripple"><span class="pull-right nav-label"></span><span>Lock</span><span class="md-ripple"></span></a></li>
              <li><a href="recover.html" class="ripple"><span class="pull-right nav-label"></span><span>Recover</span><span class="md-ripple"></span></a></li>
            </ul>
          </li>
          <li><a href="../../angularjs/" class="ripple"><span class="nav-icon"><em class="ion-android-open"></em></span><span>AngularJS</span><span class="md-ripple"></span></a></li>
        </ul>
      </nav>
    </div>
  </aside>
</template>