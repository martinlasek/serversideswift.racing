<template>
  <header class="header-container">
    <nav>
      <ul class="visible-xs visible-sm">
        <li><a id="sidebar-toggler" href="#" class="menu-link menu-link-slide"><span><em></em></span></a></li>
      </ul>
      <ul class="hidden-xs">
        <li><a id="offcanvas-toggler" href="#" class="menu-link menu-link-slide"><span><em></em></span></a></li>
      </ul>
      <h2 class="header-title">Dashboard</h2>
      <ul class="pull-right">
        <li><a id="header-search" href="#" class="ripple"><em class="ion-ios-search-strong"></em><span class="md-ripple"></span></a></li>
        <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle has-badge ripple"><em class="ion-person"></em><sup class="badge bg-danger">3</sup><span class="md-ripple"></span></a>
          <ul class="dropdown-menu dropdown-menu-right md-dropdown-menu">
            <li><a href="profile.html"><em class="ion-home icon-fw"></em>Profile</a></li>
            <li><a href="messages.html"><em class="ion-gear-a icon-fw"></em>Messages</a></li>
            <li role="presentation" class="divider"></li>
            <li><a href="user.login.html"><em class="ion-log-out icon-fw"></em>Logout</a></li>
          </ul>
        </li>
        <li><a id="header-settings" href="#" class="ripple"><em class="ion-gear-b"></em><span class="md-ripple"></span></a></li>
      </ul>
    </nav>
  </header>
</template>