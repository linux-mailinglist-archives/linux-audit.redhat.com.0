Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 41B7423CDBD
	for <lists+linux-audit@lfdr.de>; Wed,  5 Aug 2020 19:46:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501--DTy1yVVMOuHTXgxYi1YbA-1; Wed, 05 Aug 2020 13:46:37 -0400
X-MC-Unique: -DTy1yVVMOuHTXgxYi1YbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A68CC79EC1;
	Wed,  5 Aug 2020 17:46:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7778C7B916;
	Wed,  5 Aug 2020 17:46:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F33796913;
	Wed,  5 Aug 2020 17:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075H0DL5019507 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 13:00:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7734201EB66; Wed,  5 Aug 2020 17:00:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E00CC202DD7E
	for <linux-audit@redhat.com>; Wed,  5 Aug 2020 17:00:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6638E800050
	for <linux-audit@redhat.com>; Wed,  5 Aug 2020 17:00:08 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-469-dSaLR9ARMBm18LPkZC5VnQ-1;
	Wed, 05 Aug 2020 13:00:05 -0400
X-MC-Unique: dSaLR9ARMBm18LPkZC5VnQ-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 075Gxe6x030131;
	Wed, 5 Aug 2020 16:59:42 GMT
Date: Wed, 5 Aug 2020 09:59:40 -0700 (PDT)
From: James Morris <jmorris@namei.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
	LSM (IPE)
In-Reply-To: <1596639689.3457.17.camel@HansenPartnership.com>
Message-ID: <alpine.LRH.2.21.2008050934060.28225@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 05 Aug 2020 13:42:54 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
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

On Wed, 5 Aug 2020, James Bottomley wrote:

> I'll leave Mimi to answer, but really this is exactly the question that
> should have been asked before writing IPE.  However, since we have the
> cart before the horse, let me break the above down into two specific
> questions.

The question is valid and it was asked. We decided to first prototype what 
we needed and then evaluate if it should be integrated with IMA. We 
discussed this plan in person with Mimi (at LSS-NA in 2019), and presented 
a more mature version of IPE to LSS-NA in 2020, with the expectation that 
such a discussion may come up (it did not).

These patches are still part of this process and 'RFC' status.

>    1. Could we implement IPE in IMA (as in would extensions to IMA cover
>       everything).  I think the answers above indicate this is a "yes".

It could be done, if needed.

>    2. Should we extend IMA to implement it?  This is really whether from a
>       usability standpoint two seperate LSMs would make sense to cover the
>       different use cases.

One issue here is that IMA is fundamentally a measurement & appraisal 
scheme which has been extended to include integrity enforcement. IPE was 
designed from scratch to only perform integrity enforcement. As such, it 
is a cleaner design -- "do one thing and do it well" is a good design 
pattern.

In our use-case, we utilize _both_ IMA and IPE, for attestation and code 
integrity respectively. It is useful to be able to separate these 
concepts. They really are different:

- Code integrity enforcement ensures that code running locally is of known 
provenance and has not been modified prior to execution.

- Attestation is about measuring the health of a system and having that 
measurement validated by a remote system. (Local attestation is useless).

I'm not sure there is value in continuing to shoe-horn both of these into 
IMA.


>  I've got to say the least attractive thing
>       about separation is the fact that you now both have a policy parser.
>        You've tried to differentiate yours by making it more Kconfig
>       based, but policy has a way of becoming user space supplied because
>       the distros hate config options, so I think you're going to end up
>       with a policy parser very like IMAs.


-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

