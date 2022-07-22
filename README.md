# To get the maximum height of cell present in collection view.

## [Problem Statement](https://drive.google.com/file/d/1QHUFv1V7QDAsgxicmmWwCDmr9r_KwrH8/view?usp=sharing) ❓
- Given fixed set of collection view cells.
- Consider 10 cells with different layout configuration.
- Render all the cells with the maximum height available out of all present cells in collection view.

## Solution 1 - ❌
- Used collection view compositional layout.
- Implemented ```.estimated(10)``` for item layout height.
- Works well, but all cells are rendered in their respective sizes, 1 step closer to our requirement.

## Soultion 2 - 🤔
- Created custom layout subclassing ```UICollectionViewCompositionalLayout```.
- Overridden ```layoutAttributesForItem``` and keep a track of layout attributes, specifically height.
- Scroll collection view to the last index to obtain the layout of all cells.
- Re-render the collection view with the maximum height obtained from the previous pass.
- Takes a lot of memory, need to render collection view twice 😥.


> Kindly download the repo & Keep 👀 on:
> ZLayout.Swift

> ✉️ : shubham9032@gmail.com, mehulsrivastava92@gmail.com
