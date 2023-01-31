Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A668680E
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 15:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675260972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EFIl9ILr7fKqufblSj4XNCS+FgMkbwpByaDyC9uSFWY=;
	b=B5Uc2Dyce0PLCAu315AaLv71uvXTj6vZyUG1vUWgPQNAKt8uz7JsDDwkh1uvP3cfKOkiqs
	ah2xPdo/0grD+3I4UkadRXF2AAk3MSxhM6RwXepRttht7rLEwtllbuiIUrn36V/35x5YWT
	jU97Pq9nCDZ4FZiwINnY/ii4AY1TDwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Lvthn2kGOtq52newgNMMFg-1; Wed, 01 Feb 2023 09:16:09 -0500
X-MC-Unique: Lvthn2kGOtq52newgNMMFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2BEA1C07823;
	Wed,  1 Feb 2023 14:15:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F5E0404BEC0;
	Wed,  1 Feb 2023 14:15:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A47F19465B7;
	Wed,  1 Feb 2023 14:15:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67D4A1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 23:01:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 58CEA40C2004; Tue, 31 Jan 2023 23:01:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5138440C2064
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 23:01:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 323BA1C051A6
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 23:01:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-230-IYuxpGdWNJeoO-U_d37JTQ-1; Tue,
 31 Jan 2023 18:01:02 -0500
X-MC-Unique: IYuxpGdWNJeoO-U_d37JTQ-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 02B2720E1A45; Tue, 31 Jan 2023 15:01:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 02B2720E1A45
Date: Tue, 31 Jan 2023 15:01:00 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC PATCH v9 09/16] block|security: add LSM blob to block_device
Message-ID: <20230131230100.GA30104@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-10-git-send-email-wufan@linux.microsoft.com>
 <Y9jXJ8FrmAnzob7w@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y9jXJ8FrmAnzob7w@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 01 Feb 2023 14:15:41 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 12:53:59AM -0800, Christoph Hellwig wrote:
> On Mon, Jan 30, 2023 at 02:57:24PM -0800, Fan Wu wrote:
> > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > 
> > block_device structures can have valuable security properties,
> > based on how they are created, and what subsystem manages them.
> 
> That's a lot of cloudy talk but no real explanation.

Sorry for being too general here. Currently the only use target of this hook is dm-verity. We use the newly added security hook to save the dm-verity roothash and signature to the new bdev security blob during the bdev creation time, so LSMs can leverage this information to protect the system. 

I will add this example in the next version.

-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

