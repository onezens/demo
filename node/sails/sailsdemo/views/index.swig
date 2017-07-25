{% extends 'partial/layout.swig' %}
{# 声明本页面调用的模块 #}
{% set module = 'default/index' -%}
{% block title -%}Woo 的博客{%- endblock %}
{% block content -%}
    <div>
        <p>
            这是 Woo 的博客?
        </p>
    </div>
{%- endblock %}
