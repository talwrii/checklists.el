# Checklists.el -- A checklist system implemented in emacs

Maintain a set of checklists in emacs; easily and quickly display them.

# Motivation

In part, expertise consists of carrying out a given set of actions associated with an activity. However, not all activities are done often enough to internalize these steps. For such rarely done activities, defining a set of reminders when carrying out a given task can help one avoid mistakes. Further, the act of defining a checklist can aid with the internalization of a process, and for tasks where mistakes are very expensive a checklist can help avoid these mistakes.

# Using this package

Ensure checklist.el is on the [load-path](https://www.gnu.org/software/emacs/manual/html_node/elisp/Library-Search.html).

Add the following to your `init.el` file:

```
(require 'checklist)
```

* To create a new checklist run `checklist-create`.
* To view an existing checklist run `checklist-view`.
* To edit an existing checklist run `checklist-edit`.

If you regularly use this package, then you will want to create keybindings for these packages.

# Prior work

This project was largely motivated by the book [The Checklist Manifesto](https://www.amazon.co.uk/Checklist-Manifesto-Things-Right-Gawande/dp/1846683149) written by Atul Gawande, which highlights the use of checklists in various industries as an argument for the adoption of checklists within the medical sector.
