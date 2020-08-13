Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA42243C69
	for <lists+linux-audit@lfdr.de>; Thu, 13 Aug 2020 17:22:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-7u8-2bXVMAWaUgeZRHD2_A-1; Thu, 13 Aug 2020 11:22:15 -0400
X-MC-Unique: 7u8-2bXVMAWaUgeZRHD2_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9927800D53;
	Thu, 13 Aug 2020 15:22:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D8F5C1C2;
	Thu, 13 Aug 2020 15:22:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84743181A86E;
	Thu, 13 Aug 2020 15:22:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DFASrn025593 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 11:10:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 974D42166BA3; Thu, 13 Aug 2020 15:10:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92A542166B44
	for <linux-audit@redhat.com>; Thu, 13 Aug 2020 15:10:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A47F5805C0E
	for <linux-audit@redhat.com>; Thu, 13 Aug 2020 15:10:25 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-508-6JGwvTicPcu2M-kxJ1ma9Q-1;
	Thu, 13 Aug 2020 11:10:22 -0400
X-MC-Unique: 6JGwvTicPcu2M-kxJ1ma9Q-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 31D6D8EE1E5; 
	Thu, 13 Aug 2020 08:10:19 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jxbPeuibIPjQ; Thu, 13 Aug 2020 08:10:19 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B99EB8EE0F8;
	Thu, 13 Aug 2020 08:10:17 -0700 (PDT)
Message-ID: <1597331416.3708.26.camel@HansenPartnership.com>
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
	LSM (IPE)
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Thu, 13 Aug 2020 08:10:16 -0700
In-Reply-To: <D470BA4B-EF1A-49CA-AFB9-0F7FFC4C6001@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
	<1597161218.4325.38.camel@HansenPartnership.com>
	<02D551EF-C975-4B91-86CA-356FA0FF515C@gmail.com>
	<1597247482.7293.18.camel@HansenPartnership.com>
	<D470BA4B-EF1A-49CA-AFB9-0F7FFC4C6001@gmail.com>
Mime-Version: 1.0
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
X-Mailman-Approved-At: Thu, 13 Aug 2020 11:21:59 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>, Paul,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-13 at 10:42 -0400, Chuck Lever wrote:
> > On Aug 12, 2020, at 11:51 AM, James Bottomley <James.Bottomley@Hans
> > enPartnership.com> wrote:
> > On Wed, 2020-08-12 at 10:15 -0400, Chuck Lever wrote:
> > > > On Aug 11, 2020, at 11:53 AM, James Bottomley
> > > > <James.Bottomley@HansenPartnership.com> wrote:
> > > > On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
[...]
> > > > > > > The client would have to reconstruct that tree again if
> > > > > > > memory pressure caused some or all of the tree to be
> > > > > > > evicted, so perhaps an on-demand mechanism is preferable.
> > > > > > 
> > > > > > Right, but I think that's implementation detail.  Probably
> > > > > > what we need is a way to get the log(N) verification hashes
> > > > > > from the server and it's up to the client whether it caches
> > > > > > them or not.
> > > > > 
> > > > > Agreed, these are implementation details. But see above about
> > > > > the trustworthiness of the intermediate hashes. If they are
> > > > > conveyed on an untrusted network, then they can't be trusted
> > > > > either.
> > > > 
> > > > Yes, they can, provided enough of them are asked for to
> > > > verify.  If you look at the simple example above, suppose I
> > > > have cached H11 and H12, but I've lost the entire H2X layer.  I
> > > > want to verify B3 so I also ask you for your copy of H24.  Then
> > > > I generate H23 from B3 and Hash H23 and H24.  If this doesn't
> > > > hash to H12 I know either you supplied me the wrong block or
> > > > lied about H24.  However, if it all hashes correctly I know you
> > > > supplied me with both the correct B3 and the correct H24.
> > > 
> > > My point is there is a difference between a trusted cache and an
> > > untrusted cache. I argue there is not much value in a cache where
> > > the hashes have to be verified again.
> > 
> > And my point isn't about caching, it's about where the tree comes
> > from. I claim and you agree the client can get the tree from the
> > server a piece at a time (because it can path verify it) and
> > doesn't have to generate it itself.
> 
> OK, let's focus on where the tree comes from. It is certainly
> possible to build protocol to exchange parts of a Merkle tree.

Which is what I think we need to extend IMA to do.

>  The question is how it might be stored on the server.

I think the only thing the server has to guarantee to store is the head
hash, possibly signed.

>  There are some underlying assumptions about the metadata storage
> mechanism that should be stated up front.
> 
> Current forms of IMA metadata are limited in size and stored in a
> container that is read and written in a single operation. If we stick
> with that container format, I don't see a way to store a Merkle tree
> in there for all file sizes.

Well, I don't think you need to.  The only thing that needs to be
stored is the head hash.  Everything else can be reconstructed.  If you
asked me to implement it locally, I'd probably put the head hash in an
xattr but use a CAM based cache for the merkel trees and construct the
tree on first access if it weren't already in the cache.

However, the above isn't what fs-verity does: it stores the tree in a
hidden section of the file.  That's why I don't think we'd mandate
anything about tree storage.  Just describe the partial retrieval
properties we'd like and leave the rest as an implementation detail.

> Thus it seems to me that we cannot begin to consider the tree-on-the-
> server model unless there is a proposed storage mechanism for that
> whole tree. Otherwise, the client must have the primary role in
> unpacking and verifying the tree.

Well, as I said,  I don't think you need to store the tree.  You
certainly could decide to store the entire tree (as fs-verity does) if
it fitted your use case, but it's not required.  Perhaps even in my
case I'd make the CAM based cache persistent, like android's dalvik
cache.

James


> Storing only the tree root in the metadata means the metadata format
> is nicely bounded in size.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

