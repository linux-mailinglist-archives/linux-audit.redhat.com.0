Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD3231EAF
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 14:40:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-khBW_KIUM3OJ2Ye5ST2K7A-1; Wed, 29 Jul 2020 08:40:51 -0400
X-MC-Unique: khBW_KIUM3OJ2Ye5ST2K7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44CA3107BEF6;
	Wed, 29 Jul 2020 12:40:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1735569327;
	Wed, 29 Jul 2020 12:40:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DE1F1809561;
	Wed, 29 Jul 2020 12:40:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SNtE9K005677 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:55:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 028742156890; Tue, 28 Jul 2020 23:55:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E59EA2166BA2
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADD2D8007C9
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:55:11 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-393-vYNpxRcuOEuX2scLoAU5ng-1;
	Tue, 28 Jul 2020 19:55:07 -0400
X-MC-Unique: vYNpxRcuOEuX2scLoAU5ng-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id E32EF20B4908;
	Tue, 28 Jul 2020 16:55:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E32EF20B4908
From: Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [RFC PATCH v5 06/11] dm-verity: move signature check after tree
	validation
To: Eric Biggers <ebiggers@kernel.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-7-deven.desai@linux.microsoft.com>
	<20200728215041.GF4053562@gmail.com>
Message-ID: <a5534f1c-8979-0cfd-3989-2567f4a29dbc@linux.microsoft.com>
Date: Tue, 28 Jul 2020 16:55:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728215041.GF4053562@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 Jul 2020 08:39:41 -0400
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	mdsakib@microsoft.com, jmorris@namei.org,
	nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 7/28/2020 2:50 PM, Eric Biggers wrote:
> On Tue, Jul 28, 2020 at 02:36:06PM -0700, Deven Bowers wrote:
>> The CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG introduced by Jaskaran was
>> intended to be used to allow an LSM to enforce verifications for all
>> dm-verity volumes.
>>
>> However, with it's current implementation, this signature verification
>> occurs after the merkel-tree is validated, as a result the signature can
>> pass initial verification by passing a matching root-hash and signature.
>> This results in an unreadable block_device, but that has passed signature
>> validation (and subsequently, would be marked as verified).
>>
>> This change moves the signature verification to after the merkel-tree has
>> finished validation.
>>
>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
>> ---
>>   drivers/md/dm-verity-target.c     |  44 ++++------
>>   drivers/md/dm-verity-verify-sig.c | 140 ++++++++++++++++++++++--------
>>   drivers/md/dm-verity-verify-sig.h |  24 +++--
>>   drivers/md/dm-verity.h            |   2 +-
>>   4 files changed, 134 insertions(+), 76 deletions(-)
>>
>> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
>> index eec9f252e935..fabc173aa7b3 100644
>> --- a/drivers/md/dm-verity-target.c
>> +++ b/drivers/md/dm-verity-target.c
>> @@ -471,9 +471,9 @@ static int verity_verify_io(struct dm_verity_io *io)
>>   	struct bvec_iter start;
>>   	unsigned b;
>>   	struct crypto_wait wait;
>> +	int r;
>>   
>>   	for (b = 0; b < io->n_blocks; b++) {
>> -		int r;
>>   		sector_t cur_block = io->block + b;
>>   		struct ahash_request *req = verity_io_hash_req(v, io);
>>   
>> @@ -530,6 +530,16 @@ static int verity_verify_io(struct dm_verity_io *io)
>>   			return -EIO;
>>   	}
>>   
>> +	/*
>> +	 * At this point, the merkel tree has finished validating.
>> +	 * if signature was specified, validate the signature here.
>> +	 */
>> +	r = verity_verify_root_hash(v);
>> +	if (r < 0) {
>> +		DMERR_LIMIT("signature mismatch");
>> +		return r;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> This doesn't make any sense.
> 
> This just moves the signature verification to some random I/O.
> 
> The whole point of dm-verity is that data is verified on demand.  You can't know
> whether any particular data or hash block is consistent with the root hash or
> not until it is read and verified.
> 
> When the first I/O completes it might have just checked one block of a billion.
> 
> Not to mention that you didn't consider locking at all.
> 
> - Eric
> 

I appear to have dangerously misunderstood how dm-verity works under the
covers. What I thought was happening here was that *this* would be where
the first I/O that completes validation and has been verified - the root
hash signature could then be checked against the root hash, and then
no-op for remaining blocks, provided the signature validates.

The reason why I was proposing moving the signature check, is that I was 
afraid of the block_device being created in dm-verity with a root-hash 
that belongs to a different device + a signature that verifies that
root-hash, would get past verity_ctr, as despite the root hash not
matching the hash tree, the signature and the root hash will be 
verified. At this point, a block_device structure would be resident in
the kernel with the security attributes I propose in the next patch in 
the series. This device would never be read successfully, but the
structure with the attribute would exist.

This felt odd because there would be a structure in the kernel with an
attribute that says it passed a security check, but the block_device is
effectively invalid.

I realize now that that's a pretty ridiculous situation because the 
theoretical attack with access to manipulate the kernel memory in such a 
way to make it viable could just override whatever is needed to make the 
exploit work, and isn't unique to dm-verity.

I'm going to drop this patch in the next iteration of this series.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

