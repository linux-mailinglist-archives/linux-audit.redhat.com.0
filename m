Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D40B240B96
	for <lists+linux-audit@lfdr.de>; Mon, 10 Aug 2020 19:05:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-gy11iuvXNOyKFk3doulLPQ-1; Mon, 10 Aug 2020 13:05:31 -0400
X-MC-Unique: gy11iuvXNOyKFk3doulLPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8882257;
	Mon, 10 Aug 2020 17:05:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 035B619C4F;
	Mon, 10 Aug 2020 17:05:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 302DD9753E;
	Mon, 10 Aug 2020 17:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AGaJCP019437 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 12:36:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEA121008907; Mon, 10 Aug 2020 16:36:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA1D41008B98
	for <linux-audit@redhat.com>; Mon, 10 Aug 2020 16:36:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 581998007D9
	for <linux-audit@redhat.com>; Mon, 10 Aug 2020 16:36:16 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-554-n1JdnKooPjS9u72Lo2rCeQ-1; Mon, 10 Aug 2020 12:36:09 -0400
X-MC-Unique: n1JdnKooPjS9u72Lo2rCeQ-1
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07AGWeBp019122; Mon, 10 Aug 2020 12:36:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32src1ja2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 10 Aug 2020 12:36:07 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07AGYlH1024628;
	Mon, 10 Aug 2020 12:36:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32src1ja1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 10 Aug 2020 12:36:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07AGZZ1H008254; Mon, 10 Aug 2020 16:36:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 32skahaf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 10 Aug 2020 16:36:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07AGa2XL60031394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 10 Aug 2020 16:36:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6000911C04A;
	Mon, 10 Aug 2020 16:36:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA86511C058;
	Mon, 10 Aug 2020 16:35:56 +0000 (GMT)
Received: from sig-9-65-241-154.ibm.com (unknown [9.65.241.154])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Aug 2020 16:35:56 +0000 (GMT)
Message-ID: <4664ab7dc3b324084df323bfa4670d5bfde76e66.camel@linux.ibm.com>
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
	LSM (IPE)
From: Mimi Zohar <zohar@linux.ibm.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Chuck Lever
	<chucklever@gmail.com>, James Morris <jmorris@namei.org>
Date: Mon, 10 Aug 2020 12:35:56 -0400
In-Reply-To: <1597073737.3966.12.camel@HansenPartnership.com>
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
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-10_12:2020-08-06,
	2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 adultscore=0
	mlxscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
	priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
	spamscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2006250000 definitions=main-2008100119
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 13:05:07 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, Paul, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-10 at 08:35 -0700, James Bottomley wrote:
> On Sun, 2020-08-09 at 13:16 -0400, Mimi Zohar wrote:
> > On Sat, 2020-08-08 at 13:47 -0400, Chuck Lever wrote:
> > > > On Aug 5, 2020, at 2:15 PM, Mimi Zohar <zohar@linux.ibm.com>
> > > > wrote:
> > 
> > <snip>
> > 
> > > > If block layer integrity was enough, there wouldn't have been a
> > > > need for fs-verity.   Even fs-verity is limited to read only
> > > > filesystems, which makes validating file integrity so much
> > > > easier.  From the beginning, we've said that fs-verity signatures
> > > > should be included in the measurement list.  (I thought someone
> > > > signed on to add that support to IMA, but have not yet seen
> > > > anything.)
> > > 
> > > Mimi, when you and I discussed this during LSS NA 2019, I didn't
> > > fully understand that you expected me to implement signed Merkle
> > > trees for all filesystems. At the time, it sounded to me like you
> > > wanted signed Merkle trees only for NFS files. Is that still the
> > > case?
> > 
> > I definitely do not expect you to support signed Merkle trees for all
> > filesystems.  My interested is from an IMA perspective of measuring
> > and verifying the fs-verity Merkle tree root (and header info)
> > signature. This is independent of which filesystems support it.
> > 
> > > The first priority (for me, anyway) therefore is getting the
> > > ability to move IMA metadata between NFS clients and servers
> > > shoveled into the NFS protocol, but that's been blocked for various
> > > legal reasons.
> > 
> > Up to now, verifying remote filesystem file integrity has been out of
> > scope for IMA.   With fs-verity file signatures I can at least grasp
> > how remote file integrity could possibly work.  I don't understand
> > how remote file integrity with existing IMA formats could be
> > supported. You might want to consider writing a whitepaper, which
> > could later be used as the basis for a patch set cover letter.
> 
> I think, before this, we can help with the basics (and perhaps we
> should sort them out before we start documenting what we'll do).

I'm not opposed to doing that, but you're taking this discussion in a
totally different direction.  The current discussion is about NFSv4
supporting the existing IMA signatures, not only fs-verity signatures. 
I'd like to understand how that is possible and for the community to
weigh in on whether it makes sense.

> The
> first basic is that a merkle tree allows unit at a time verification.
> First of all we should agree on the unit.  Since we always fault a page
> at a time, I think our merkle tree unit should be a page not a block. 
> Next, we should agree where the check gates for the per page accesses
> should be ... definitely somewhere in readpage, I suspect and finally
> we should agree how the merkle tree is presented at the gate.  I think
> there are three ways:
> 
>    1. Ahead of time transfer:  The merkle tree is transferred and verified
>       at some time before the accesses begin, so we already have a
>       verified copy and can compare against the lower leaf.
>    2. Async transfer:  We provide an async mechanism to transfer the
>       necessary components, so when presented with a unit, we check the
>       log n components required to get to the root
>    3. The protocol actually provides the capability of 2 (like the SCSI
>       DIF/DIX), so to IMA all the pieces get presented instead of IMA
>       having to manage the tree
> 
> There are also a load of minor things like how we get the head hash,
> which must be presented and verified ahead of time for each of the
> above 3.
 
I was under the impression that IMA support for fs-verity signatures
would be limited to including the fs-verity signature in the
measurement list and verifying the fs-verity signature.   As fs-verity
is limited to immutable files, this could be done on file open.  fs-
verity would be responsible for enforcing the block/page data
integrity.   From a local filesystem perspective, I think that is all
that is necessary.

In terms of remote file systems,  the main issue is transporting and
storing the Merkle tree.  As fs-verity is limited to immutable files,
this could still be done on file open.

Mimi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

