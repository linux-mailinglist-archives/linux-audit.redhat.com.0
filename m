Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 432F1231570
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 00:15:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-kaXvAoq8NsOdy4BflHhhIw-1; Tue, 28 Jul 2020 18:15:40 -0400
X-MC-Unique: kaXvAoq8NsOdy4BflHhhIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27CCD107ACCA;
	Tue, 28 Jul 2020 22:15:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CB760C87;
	Tue, 28 Jul 2020 22:15:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C431A35A3;
	Tue, 28 Jul 2020 22:15:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SM0S4m023230 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 18:00:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E968FD016A; Tue, 28 Jul 2020 22:00:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A0CCF62F
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 22:00:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1049080CC48
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 22:00:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-434-paCjLqZwMcuHFxP5HpeWJw-1;
	Tue, 28 Jul 2020 18:00:19 -0400
X-MC-Unique: paCjLqZwMcuHFxP5HpeWJw-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 90B1F2070A;
	Tue, 28 Jul 2020 21:50:42 +0000 (UTC)
Date: Tue, 28 Jul 2020 14:50:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [RFC PATCH v5 06/11] dm-verity: move signature check after tree
	validation
Message-ID: <20200728215041.GF4053562@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-7-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20200728213614.586312-7-deven.desai@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 28 Jul 2020 18:15:29 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 28, 2020 at 02:36:06PM -0700, Deven Bowers wrote:
> The CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG introduced by Jaskaran was
> intended to be used to allow an LSM to enforce verifications for all
> dm-verity volumes.
> 
> However, with it's current implementation, this signature verification
> occurs after the merkel-tree is validated, as a result the signature can
> pass initial verification by passing a matching root-hash and signature.
> This results in an unreadable block_device, but that has passed signature
> validation (and subsequently, would be marked as verified).
> 
> This change moves the signature verification to after the merkel-tree has
> finished validation.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> ---
>  drivers/md/dm-verity-target.c     |  44 ++++------
>  drivers/md/dm-verity-verify-sig.c | 140 ++++++++++++++++++++++--------
>  drivers/md/dm-verity-verify-sig.h |  24 +++--
>  drivers/md/dm-verity.h            |   2 +-
>  4 files changed, 134 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index eec9f252e935..fabc173aa7b3 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -471,9 +471,9 @@ static int verity_verify_io(struct dm_verity_io *io)
>  	struct bvec_iter start;
>  	unsigned b;
>  	struct crypto_wait wait;
> +	int r;
>  
>  	for (b = 0; b < io->n_blocks; b++) {
> -		int r;
>  		sector_t cur_block = io->block + b;
>  		struct ahash_request *req = verity_io_hash_req(v, io);
>  
> @@ -530,6 +530,16 @@ static int verity_verify_io(struct dm_verity_io *io)
>  			return -EIO;
>  	}
>  
> +	/*
> +	 * At this point, the merkel tree has finished validating.
> +	 * if signature was specified, validate the signature here.
> +	 */
> +	r = verity_verify_root_hash(v);
> +	if (r < 0) {
> +		DMERR_LIMIT("signature mismatch");
> +		return r;
> +	}
> +
>  	return 0;
>  }

This doesn't make any sense.

This just moves the signature verification to some random I/O.

The whole point of dm-verity is that data is verified on demand.  You can't know
whether any particular data or hash block is consistent with the root hash or
not until it is read and verified.

When the first I/O completes it might have just checked one block of a billion.

Not to mention that you didn't consider locking at all.

- Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

