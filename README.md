# IOS-3DTouch
3D Touch using a Non-customized preview

And used loadView() method instead of viewOnLoad() method for designing the preview component.

Here i used just an View component for previewing 

Inorder to use preview for a Image view add below line before adding preview to its interaction,

 		imagePreview.isUserInteractionEnabled = true
