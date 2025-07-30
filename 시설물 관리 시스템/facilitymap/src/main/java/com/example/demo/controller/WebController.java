  package com.example.demo.controller;

  import com.example.demo.entity.Place;
  import com.example.demo.service.PlaceService;
  import org.springframework.stereotype.Controller;
  import org.springframework.web.bind.annotation.PostMapping;
  import org.springframework.web.bind.annotation.RequestParam;

  @Controller
  public class WebController {
      private final PlaceService placeService;

      public WebController(PlaceService placeService) {
          this.placeService = placeService;
      }

      @PostMapping("/register")
      public String register(@RequestParam String name,
                             @RequestParam String address,
                             @RequestParam double lat,
                             @RequestParam double lng) {
          Place place = new Place(name, address, lat, lng);
          placeService.save(place);
          return "redirect:/";
      }
  }