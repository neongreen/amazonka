{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.ModifyOptionGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Modifies an existing option group. https://rds.amazonaws.com/
-- ?Action=ModifyOptionGroup &OptionGroupName=myoptiongroup
-- &OptionsToInclude=OEM &DBSecurityGroupMemberships=default
-- &ApplyImmediately=true myoptiongroup Test option group oracle-se1 11.2 OEM
-- Oracle Enterprise Manager 1158 default ACTIVE
-- ed662948-a57b-11df-9e38-7ffab86c801f https://rds.amazonaws.com/
-- ?Action=ModifyOptionGroup &OptionGroupName=myoptiongroup
-- &OptionsToRemove=OEM &ApplyImmediately=true myoptiongroup Test option group
-- oracle-se1 11.2 ed662948-a57b-11df-9e38-7ffab86c801f.
module Network.AWS.RDS.ModifyOptionGroup
    (
    -- * Request
      ModifyOptionGroup
    -- ** Request constructor
    , modifyOptionGroup
    -- ** Request lenses
    , mogOptionGroupName
    , mogOptionConfiguration
    , mogOptionsToRemove
    , mogApplyImmediately

    -- * Response
    , ModifyOptionGroupResponse
    -- ** Response constructor
    , modifyOptionGroupResponse
    -- ** Response lenses
    , mogrOptionGroup
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.Types
import Network.AWS.Prelude

-- | 
data ModifyOptionGroup = ModifyOptionGroup
    { _mogOptionGroupName :: Text
    , _mogOptionConfiguration :: [OptionConfiguration]
    , _mogOptionsToRemove :: [Text]
    , _mogApplyImmediately :: Maybe Bool
    } deriving (Eq, Ord, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ModifyOptionGroup' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @OptionGroupName ::@ @Text@
--
-- * @OptionConfiguration ::@ @[OptionConfiguration]@
--
-- * @OptionsToRemove ::@ @[Text]@
--
-- * @ApplyImmediately ::@ @Maybe Bool@
--
modifyOptionGroup :: Text -- ^ 'mogOptionGroupName'
                  -> ModifyOptionGroup
modifyOptionGroup p1 = ModifyOptionGroup
    { _mogOptionGroupName = p1
    , _mogOptionConfiguration = mempty
    , _mogOptionsToRemove = mempty
    , _mogApplyImmediately = Nothing
    }

-- | The name of the option group to be modified. cannot be removed from an
-- option group while DB instances are associated with the option group. -->
-- Permanent options, such as the TDE option for Oracle Advanced Security TDE,
-- cannot be removed from an option group, and that option group cannot be
-- removed from a DB instance once it is associated with a DB instance.
mogOptionGroupName :: Lens' ModifyOptionGroup Text
mogOptionGroupName =
    lens _mogOptionGroupName (\s a -> s { _mogOptionGroupName = a })

-- | Options in this list are added to the option group or, if already present,
-- the specified configuration is used to update the existing configuration.
mogOptionConfiguration :: Lens' ModifyOptionGroup [OptionConfiguration]
mogOptionConfiguration =
    lens _mogOptionConfiguration (\s a -> s { _mogOptionConfiguration = a })

-- | Options in this list are removed from the option group.
mogOptionsToRemove :: Lens' ModifyOptionGroup [Text]
mogOptionsToRemove =
    lens _mogOptionsToRemove (\s a -> s { _mogOptionsToRemove = a })

-- | Indicates whether the changes should be applied immediately, or during the
-- next maintenance window for each instance associated with the option group.
mogApplyImmediately :: Lens' ModifyOptionGroup (Maybe Bool)
mogApplyImmediately =
    lens _mogApplyImmediately (\s a -> s { _mogApplyImmediately = a })

instance ToQuery ModifyOptionGroup where
    toQuery = genericQuery def

newtype ModifyOptionGroupResponse = ModifyOptionGroupResponse
    { _mogrOptionGroup :: Maybe OptionGroup
    } deriving (Eq, Ord, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ModifyOptionGroupResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @OptionGroup ::@ @Maybe OptionGroup@
--
modifyOptionGroupResponse :: ModifyOptionGroupResponse
modifyOptionGroupResponse = ModifyOptionGroupResponse
    { _mogrOptionGroup = Nothing
    }

-- | 
mogrOptionGroup :: Lens' ModifyOptionGroupResponse (Maybe OptionGroup)
mogrOptionGroup = lens _mogrOptionGroup (\s a -> s { _mogrOptionGroup = a })

instance FromXML ModifyOptionGroupResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ModifyOptionGroup where
    type Sv ModifyOptionGroup = RDS
    type Rs ModifyOptionGroup = ModifyOptionGroupResponse

    request = post "ModifyOptionGroup"
    response _ = xmlResponse
