	/* Cleaning Data in SQL Queries

*/

SELECT *
FROM NashvilleHousing

-------------------------------------------------------------

-- Standarize Date Format



SELECT SaleDateConverted
FROM NashvilleHousing

SELECT SaleDateConverted, CONVERT (Date, SaleDate) 
FROM NashvilleHousing

-- The below code is showing the Updating of the table, by changing the SaleDate Format to 

UPDATE NashvilleHousing
SET SaleDate = CONVERT (Date, SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

UPDATE NashvilleHousing
SET SaleDateConverted = CONVERT (Date, SaleDate)



------------------------------------------------------------------------

-- Populate Property Address data

-- this is to populate the null values pf Property Address

SELECT PropertyAddress
FROM NashvilleHousing
--WHERE PropertyAddress is NULL;
ORDER BY ParcelID

-- This is to show the whole rows that has Property address is NULL

SELECT *
FROM NashvilleHousing
WHERE PropertyAddress is NULL;

-- This is to see if we can find how the ParcelID is related to the Property Address

SELECT *
FROM NashvilleHousing
--WHERE PropertyAddress is NULL;
order by ParcelID



-- This is a self join within the same table, where the Parcel ID is connected to each other, but the UniqueID has to be different
-- ISNULL function will populate the necessary information required to replace the NULL
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, 
ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM NashvilleHousing a
JOIN NashvilleHousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL



UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM NashvilleHousing a
JOIN NashvilleHousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL



-------------------------------------------------------------------------------------

-- Breaking out address into individual columns (Address, City, State)


SELECT PropertyAddress
FROM NashvilleHousing
--WHERE PropertyAddress is NULL;
--ORDER BY ParcelID

-- SUBSTRING looks to extracts some characters froom a string of text
-- SUBSTRING syntax SUBSTRING(string, start, length)
-- CHARINDEX searches for a substring and returns the position.
-- CHARINDEX syntax CHARINDEX(substring, string, start)
-- The -1 in this syntax moves one space back to get rid of the comma

-- The LEN property is 

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) AS Address, 
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))AS Address2
FROM NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress varchar(255);

UPDATE NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

ALTER TABLE NashvilleHousing
Add PropertySplitCity varchar(255);

UPDATE NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


SELECT *
FROM NashvilleHousing

SELECT OwnerAddress
FROM NashvilleHousing


--PARSENAME returns certain part of an object name.
-- PARSENAME syntax PARSENAME ('object_name' , object_piece )

SELECT
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
FROM NashvilleHousing


ALTER TABLE NashvilleHousing
Add OwnerSplitAddress varchar(255);



UPDATE NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity varchar(255);

UPDATE NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState varchar(255);

UPDATE NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)




SELECT *
from NashvilleHousing

----------------------------------------------------------------------------------------------
-- Change Y and N to Yes or No in 'Sold as Vacant' field. 

	SELECT Distinct (SoldAsVacant), COUNT(SoldAsVacant)
	from NashvilleHousing
	group by SoldAsVacant
	order by 2


	SELECT SoldAsVacant
,	CASE When SoldAsVacant = 'Y' THEN 'Yes'
		 When SoldAsVacant = 'N' THEN 'No'
		 ELSE SoldAsVacant
		 END
	from NashvilleHousing

	UPDATE NashvilleHousing
	SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
		 When SoldAsVacant = 'N' THEN 'No'
		 ELSE SoldAsVacant
		 END
 ------------------------------------------------------------------------------------------

 -- Removing Duplicates
 -- Do not use on the raw data that is provided to you

 WITH RowNumCTE AS(
  SELECT *,
  ROW_NUMBER() OVER (
  PARTITION BY ParcelID,
			   PropertyAddress,
			   SalePrice,
			   SaleDate,
			   LegalReference
			   ORDER BY
					UniqueID
					) row_num
  FROM NashvilleHousing
  --ORDER BY ParcelID
  )

  SELECT *
  FROM RowNumCTE
  WHERE row_num > 1
  ORDER BY [UniqueID ]





  ------------------------------------------------------------------------------------------------
-- Delete Unused Columns

-- Do not use this in the raw data

SELECT *
FROM NashvilleHousing

ALTER TABLE NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, OWberSplitCity


ALTER TABLE NashvilleHousing
DROP COLUMN SaleDate
