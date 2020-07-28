Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 54B72231EAE
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 14:40:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-8GLOKqj1Pn2hZ7ZYlynyJA-1; Wed, 29 Jul 2020 08:40:51 -0400
X-MC-Unique: 8GLOKqj1Pn2hZ7ZYlynyJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C0588015CE;
	Wed, 29 Jul 2020 12:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 074BE61176;
	Wed, 29 Jul 2020 12:40:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B4A395A67;
	Wed, 29 Jul 2020 12:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SN2b3j030746 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:02:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 877452018283; Tue, 28 Jul 2020 23:02:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 815022026D69
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263378007A4
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:02:35 +0000 (UTC)
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-AgVAghHkNhCmMlosey3adw-1; Tue, 28 Jul 2020 19:02:32 -0400
X-MC-Unique: AgVAghHkNhCmMlosey3adw-1
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1k0YGR-004arw-Eo; Tue, 28 Jul 2020 22:40:03 +0000
Date: Tue, 28 Jul 2020 23:40:03 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [RFC PATCH v5 05/11] fs: add security blob and hooks for
	block_device
Message-ID: <20200728224003.GC951209@ZenIV.linux.org.uk>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-6-deven.desai@linux.microsoft.com>
	<ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 Jul 2020 08:39:41 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	corbet@lwn.net, jmorris@namei.org, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, axboe@kernel.dk,
	mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
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

On Tue, Jul 28, 2020 at 03:22:59PM -0700, Casey Schaufler wrote:

> > +	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
> > +		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
> > +
> > +		if (rc == -ENOSYS)
> > +			rc = 0;
> > +
> > +		if (rc != 0)
> 
> Perhaps:
> 		else if (rc != 0)
> 
> > +			break;
> > +	}
> > +
> > +	return rc;

	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
		if (rc && rc != -ENOSYS)
			return rc;
	}
	return 0;

Easier to reason about that way...

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

