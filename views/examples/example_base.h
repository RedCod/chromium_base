// Copyright (c) 2011 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef VIEWS_EXAMPLES_EXAMPLE_BASE_H_
#define VIEWS_EXAMPLES_EXAMPLE_BASE_H_
#pragma once

#include <string>

#include "base/basictypes.h"

namespace views {
class View;
}

namespace examples {

class ExamplesMain;

class ExampleBase {
 public:
  // Returns the view containing this example controls.
  // This view is added as a tab to the example application.
  views::View* GetExampleView() { return container_; }

  // Sub-classes should creates and add the views to the given parent.
  virtual void CreateExampleView(views::View* parent) = 0;

  // Sub-classes should return the name of this test.
  // It is used as the title of the tab displaying this test's controls.
  virtual std::wstring GetExampleTitle() = 0;

 protected:
  explicit ExampleBase(ExamplesMain* main);
  virtual ~ExampleBase();

  // Prints a message in the status area, at the bottom of the window.
  void PrintStatus(const char* format, ...);

  // Converts an boolean value to "on" or "off".
  const char* BoolToOnOff(bool value) {
    return value ? "on" : "off";
  }

 private:
  // The runner actually running this test.
  ExamplesMain* main_;

  // The view containing example views.
  views::View* container_;

  DISALLOW_COPY_AND_ASSIGN(ExampleBase);
};

}  // namespace examples

#endif  // VIEWS_EXAMPLES_EXAMPLE_BASE_H_
