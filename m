Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B444F24510F
	for <lists+linux-audit@lfdr.de>; Sat, 15 Aug 2020 15:51:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-oNqUyG16OJuMwOvLL-bK6w-1; Sat, 15 Aug 2020 09:51:35 -0400
X-MC-Unique: oNqUyG16OJuMwOvLL-bK6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE9C1800D42;
	Sat, 15 Aug 2020 13:51:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE315D9CC;
	Sat, 15 Aug 2020 13:51:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA9334EE16;
	Sat, 15 Aug 2020 13:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07EELpnI023116 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 10:21:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C99CAB596; Fri, 14 Aug 2020 14:21:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79BBFAB597
	for <linux-audit@redhat.com>; Fri, 14 Aug 2020 14:21:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87493811E83
	for <linux-audit@redhat.com>; Fri, 14 Aug 2020 14:21:48 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-j8PwChryNLSmi7sxykivVw-1; Fri, 14 Aug 2020 10:21:33 -0400
X-MC-Unique: j8PwChryNLSmi7sxykivVw-1
Received: by mail-io1-f68.google.com with SMTP id a5so10814408ioa.13;
	Fri, 14 Aug 2020 07:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ceuzR87451Cc6ZPbAaw/Ws6GJIlBw8/7uWYzi3GVwJA=;
	b=oaKucnMlSWIXuWiG6h9a4EG85UDayd2lELTQ3BP0QA7RlgaUjs2M3feuoVH1tzlLcU
	+6nq/CUtXGsqs0nH7nPcWKfvDds99/CMbu8ICmJG1k8dyomTMjqa3kQ4tSX/JZWO8fMH
	MvhrsZE8CAj4kHNrb5Nlzx7S9cB8LghQgsn68BVgR/jx60Rwm6U+oQj2KpczF25uZ67F
	2VomuoUXG4AlAfcia048PwTDnlWdiITVg06ynE5nX2TIjRyyOKtja8RUvxVttKnAdasW
	homWirSXtaLHKfQYPTqYGFXx9/gyJMWy/MwHuQhAuXb5efjN7/Aqdf1DzBuMnTKXITcI
	7CIg==
X-Gm-Message-State: AOAM533z+//xLudNho2pgqOW/SAT9Qd1uN/E11nRhBcUYdK4sLbDxsmu
	W6e+z+IYDCd04xxpSueAm4aHQClJeHTFbd2Q
X-Google-Smtp-Source: ABdhPJweSZedFvqsUMFWyIpazr8WaDF573/xdtkmOjFpEuaDTmOAqcznkxDaJ7yyQKrPSVkkZ6yu+w==
X-Received: by 2002:a6b:b74b:: with SMTP id h72mr2392562iof.52.1597414892064; 
	Fri, 14 Aug 2020 07:21:32 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id c4sm118316ioi.44.2020.08.14.07.21.28
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2020 07:21:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement LSM
	(IPE)
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597331416.3708.26.camel@HansenPartnership.com>
Date: Fri, 14 Aug 2020 10:21:26 -0400
Message-Id: <5A966AA7-9E39-4F59-A9B7-4308AF6F3333@gmail.com>
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
	<1597331416.3708.26.camel@HansenPartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07EELpnI023116
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 15 Aug 2020 09:50:55 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 13, 2020, at 11:10 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Thu, 2020-08-13 at 10:42 -0400, Chuck Lever wrote:
>>> On Aug 12, 2020, at 11:51 AM, James Bottomley <James.Bottomley@Hans
>>> enPartnership.com> wrote:
>>> On Wed, 2020-08-12 at 10:15 -0400, Chuck Lever wrote:
>>>>> On Aug 11, 2020, at 11:53 AM, James Bottomley
>>>>> <James.Bottomley@HansenPartnership.com> wrote:
>>>>> On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
> [...]
>>>>>>>> The client would have to reconstruct that tree again if
>>>>>>>> memory pressure caused some or all of the tree to be
>>>>>>>> evicted, so perhaps an on-demand mechanism is preferable.
>>>>>>> 
>>>>>>> Right, but I think that's implementation detail.  Probably
>>>>>>> what we need is a way to get the log(N) verification hashes
>>>>>>> from the server and it's up to the client whether it caches
>>>>>>> them or not.
>>>>>> 
>>>>>> Agreed, these are implementation details. But see above about
>>>>>> the trustworthiness of the intermediate hashes. If they are
>>>>>> conveyed on an untrusted network, then they can't be trusted
>>>>>> either.
>>>>> 
>>>>> Yes, they can, provided enough of them are asked for to
>>>>> verify.  If you look at the simple example above, suppose I
>>>>> have cached H11 and H12, but I've lost the entire H2X layer.  I
>>>>> want to verify B3 so I also ask you for your copy of H24.  Then
>>>>> I generate H23 from B3 and Hash H23 and H24.  If this doesn't
>>>>> hash to H12 I know either you supplied me the wrong block or
>>>>> lied about H24.  However, if it all hashes correctly I know you
>>>>> supplied me with both the correct B3 and the correct H24.
>>>> 
>>>> My point is there is a difference between a trusted cache and an
>>>> untrusted cache. I argue there is not much value in a cache where
>>>> the hashes have to be verified again.
>>> 
>>> And my point isn't about caching, it's about where the tree comes
>>> from. I claim and you agree the client can get the tree from the
>>> server a piece at a time (because it can path verify it) and
>>> doesn't have to generate it itself.
>> 
>> OK, let's focus on where the tree comes from. It is certainly
>> possible to build protocol to exchange parts of a Merkle tree.
> 
> Which is what I think we need to extend IMA to do.
> 
>> The question is how it might be stored on the server.
> 
> I think the only thing the server has to guarantee to store is the head
> hash, possibly signed.
> 
>> There are some underlying assumptions about the metadata storage
>> mechanism that should be stated up front.
>> 
>> Current forms of IMA metadata are limited in size and stored in a
>> container that is read and written in a single operation. If we stick
>> with that container format, I don't see a way to store a Merkle tree
>> in there for all file sizes.
> 
> Well, I don't think you need to.  The only thing that needs to be
> stored is the head hash.  Everything else can be reconstructed.  If you
> asked me to implement it locally, I'd probably put the head hash in an
> xattr but use a CAM based cache for the merkel trees and construct the
> tree on first access if it weren't already in the cache.

The contents of the security.ima xattr might be modeled after
EVM_IMA_DIGSIG:

- a format enumerator (used by all IMA metadata formats)
- the tree's unit size
- a fingerprint of the signer's certificate
  - digest algorithm name and full digest
- the root hash, always signed
  - signing algorithm name and signature

The rest of the hash tree is always stored somewhere else or
constructed on-demand.

My experience of security communities both within and outside the
IETF is that they would insist on always having a signature.

If one doesn't care about signing, a self-signed certificate can be
automatically provisioned when ima-evm-utils is installed that can
be used for those cases. That would make the signature process
invisible to any administrator who doesn't care about signed
metadata.

Because storage in NFS would cross trust boundaries, it would have
to require the use of a signed root hash. I don't want to be in the
position where copying a file with an unsigned root hash into NFS
makes it unreadable because of a change in policy.


> However, the above isn't what fs-verity does: it stores the tree in a
> hidden section of the file.  That's why I don't think we'd mandate
> anything about tree storage.  Just describe the partial retrieval
> properties we'd like and leave the rest as an implementation detail.

I'm starting to consider how much compatibility with fs-verity is
required. There are several forms of hash-tree, and a specification
of the IMA metadata format would need to describe exactly how to
form the tree root. If we want compatibility with fs-verity, then
it is reasonable to assume that this IMA metadata format might be
required to use the same hash tree construction algorithm that
fs-verity uses.

The original Merkle tree concept was patented 40 years ago. I'm not
clear yet on whether the patent encumbers the use of Merkle trees
in any way, but since their usage seems pretty widespread in P2P
and BitCoin applications, I'm guessing the answer to that is
favorable. More research needed.

There is an implementation used by several GNU utilities that is
available as a piece of GPL code. It could be a potential blocker
if that was the tree algorithm that fs-verity uses -- as discussed
in the other thread.

Apparently there are some known weaknesses in older hash tree
algorithms, including at least one CVE. We could choose a recent
algorithm, but perhaps there needs to be a degree of extensibility
in case that algorithm needs to be updated due to a subsequent
security issue.

Tree construction could include a few items besides file content to
help secure the hash further. For instance the file's size and mtime,
as well as the depth of the tree, could be included in the signature.
But that depends on whether it can be done while maintaining
compatibility with fs-verity.

I would feel better if someone with more domain expertise chimed in.


>> Thus it seems to me that we cannot begin to consider the tree-on-the-
>> server model unless there is a proposed storage mechanism for that
>> whole tree. Otherwise, the client must have the primary role in
>> unpacking and verifying the tree.
> 
> Well, as I said,  I don't think you need to store the tree.

We basically agree there.


> You certainly could decide to store the entire tree (as fs-verity does) if
> it fitted your use case, but it's not required.  Perhaps even in my
> case I'd make the CAM based cache persistent, like android's dalvik
> cache.
> 
> James
> 
> 
>> Storing only the tree root in the metadata means the metadata format
>> is nicely bounded in size.

--
Chuck Lever
chucklever@gmail.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

