import $ from 'jquery';
import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { clickToInput } from '../components/button-searchbar';
clickToInput();

import { imagesSlides } from "../components/slickAnim";
imagesSlides();

// import { addPhotos } from '../components/addPhotos';
// addPhotos();

import { initDropzones } from '../components/picturesDropzone';
initDropzones();
