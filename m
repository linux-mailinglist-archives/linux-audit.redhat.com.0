Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A5A1523F1CC
	for <lists+linux-audit@lfdr.de>; Fri,  7 Aug 2020 19:17:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-oHKzooXjPZiBs8p7XcDBLQ-1; Fri, 07 Aug 2020 13:17:26 -0400
X-MC-Unique: oHKzooXjPZiBs8p7XcDBLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 902C519057A2;
	Fri,  7 Aug 2020 17:17:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFA68AC0D;
	Fri,  7 Aug 2020 17:17:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE0C01809554;
	Fri,  7 Aug 2020 17:17:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077GffFg007586 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 12:41:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10684218ADC0; Fri,  7 Aug 2020 16:41:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1099217B43F
	for <linux-audit@redhat.com>; Fri,  7 Aug 2020 16:41:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 921048007A4
	for <linux-audit@redhat.com>; Fri,  7 Aug 2020 16:41:38 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-370-JE0jBdHVNvi9ad_7uG3NPA-1;
	Fri, 07 Aug 2020 12:41:28 -0400
X-MC-Unique: JE0jBdHVNvi9ad_7uG3NPA-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 077Gf5ki013063;
	Fri, 7 Aug 2020 16:41:05 GMT
Date: Sat, 8 Aug 2020 02:41:05 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
	LSM (IPE)
In-Reply-To: <eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
Message-ID: <alpine.LRH.2.21.2008080240350.13040@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com> 
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com> 
	<alpine.LRH.2.21.2008060949410.20084@namei.org>
	<eb7a2f5b5cd22cf9231aa0fd8fdb77c729a83428.camel@linux.ibm.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 07 Aug 2020 13:17:15 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2020, Mimi Zohar wrote:

> On Thu, 2020-08-06 at 09:51 +1000, James Morris wrote:
> > On Wed, 5 Aug 2020, Mimi Zohar wrote:
> > 
> > > If block layer integrity was enough, there wouldn't have been a need
> > > for fs-verity.   Even fs-verity is limited to read only filesystems,
> > > which makes validating file integrity so much easier.  From the
> > > beginning, we've said that fs-verity signatures should be included in
> > > the measurement list.  (I thought someone signed on to add that support
> > > to IMA, but have not yet seen anything.)
> > > 
> > > Going forward I see a lot of what we've accomplished being incorporated
> > > into the filesystems.  When IMA will be limited to defining a system
> > > wide policy, I'll have completed my job.
> > 
> > What are your thoughts on IPE being a standalone LSM? Would you prefer to 
> > see its functionality integrated into IMA?
> 
> Improving the integrity subsystem would be preferred.
> 

Are you planning to attend Plumbers? Perhaps we could propose a BoF 
session on this topic.

-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

