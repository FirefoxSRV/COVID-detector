"""covid_prediction URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myApp.views import predict_covid,predict_covid_DT,predict_covid_RF

urlpatterns = [
    path("admin/", admin.site.urls),
    path('predict/', predict_covid, name='predict_covid'),
    path('predictDT/',predict_covid_DT,name='predict_covid_DT'),
    path('predictRF/',predict_covid_RF,name='predict_covid_RF')
]
