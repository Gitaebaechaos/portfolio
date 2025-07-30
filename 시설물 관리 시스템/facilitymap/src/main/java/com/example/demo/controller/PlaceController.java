package com.example.demo.controller;

import com.example.demo.entity.Place;
import com.example.demo.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/places")
@CrossOrigin(origins = "*")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    // 전체 시설물 목록 조회
    @GetMapping
    public List<Place> getAllPlaces() {
        return placeService.findAll();
    }

    // 시설물 등록 (JSON 방식)
    @PostMapping
    public Place createPlace(@RequestBody Place place) {
        return placeService.save(place);
    }
    
    // 시설물 정보 수정 (UPDATE)
    @PutMapping
    public Place updatePlace(@RequestBody Place place) {
        return placeService.save(place);
    }

    // 시설물 삭제
    @DeleteMapping("/{id}")
    public void deletePlace(@PathVariable Long id) {
        placeService.delete(id);
    }
}