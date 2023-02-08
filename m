Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18968EFE5
	for <lists+linux-audit@lfdr.de>; Wed,  8 Feb 2023 14:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675863388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MTqWKPGfALXTDI7S9jQexenlRHqGWXJNQc/61ziGUYQ=;
	b=A1Qg7D4OmF2NqfVujxT0KNO4mwHduqqCEqzKDkjq6yKaDyVhCa3pZrX/TeLeseu89UvO6H
	9HkNhj7Jh9Bd0uleYrzv7JOgqTAAqNIb9f9qcUt1BKUungQk+MyRFwdZn43TgmCCXNJ5Ct
	pC8fN7SmmA8XkzhGowTFalFkmkHYitk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-vtjGqEuCNbymoqqAxHES6g-1; Wed, 08 Feb 2023 08:36:24 -0500
X-MC-Unique: vtjGqEuCNbymoqqAxHES6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CEE85A588;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35D93140EBF4;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E1E91946589;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F391A1946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Feb 2023 00:31:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D197F400D9D0; Wed,  8 Feb 2023 00:31:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0864024CA2
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 00:31:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD7293C10681
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 00:31:06 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-159-ltToBvASOAC6L0hyr-QZpQ-1; Tue,
 07 Feb 2023 19:31:04 -0500
X-MC-Unique: ltToBvASOAC6L0hyr-QZpQ-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 91E3120C7E38; Tue,  7 Feb 2023 16:31:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 91E3120C7E38
Date: Tue, 7 Feb 2023 16:31:03 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 00/16] Integrity Policy Enforcement LSM (IPE)
Message-ID: <20230208003103.GC5107@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <033335b26f6becdc3dc0325ef926efd94fcc4dda.camel@huaweicloud.com>
 <20230201004852.GB30104@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <7dc9963c563d0b55bb35109be012e355eef13882.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <7dc9963c563d0b55bb35109be012e355eef13882.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 08 Feb 2023 13:36:13 +0000
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
 linux-doc@vger.kernel.org, snitzer@kernel.org, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 02, 2023 at 11:48:18AM +0100, Roberto Sassu wrote:
> On Tue, 2023-01-31 at 16:48 -0800, Fan Wu wrote:
> > On Tue, Jan 31, 2023 at 03:22:05PM +0100, Roberto Sassu wrote:
> > > On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > > > IPE has two known gaps:
> > > > 
> > > > 1. IPE cannot verify the integrity of anonymous executable memory, such as
> > > >   the trampolines created by gcc closures and libffi (<3.4.2), or JIT'd code.
> > > >   Unfortunately, as this is dynamically generated code, there is no way
> > > >   for IPE to ensure the integrity of this code to form a trust basis. In all
> > > >   cases, the return result for these operations will be whatever the admin
> > > >   configures the DEFAULT action for "EXECUTE".
> > > 
> > > I think it would be useful to handle special cases, for example you
> > > could allow a process that created a file with memfd to use it, at the
> > > condition that nobody else writes it.
> > > 
> > > This would be required during the boot, otherwise services could fail
> > > to start (depending on the policy).
> > > 
> > Thanks for the suggestion. I agree with your opinion and I think supporting
> > memfd is possible but restricting read/write needs more hooks. We would like
> > to avoid adding more complexity to this initial posting as necessary. 
> > We will consider this as a future work and will post follow-on patches
> > in the future.
> 
> Ok, maybe it is necessary to specify better the scope of IPE, why the
> current implementation can be considered as complete.
> 
> If we say, IPE can only allow/deny operations on system components with
> immutable security properties, clearly memfd as a component cannot
> fullfill this goal due to the non-immutability. This would apply to any
> component allowing modifications.
> 
> How to address this? What is the immutable property then?
> 
> In the case of memfd, intuitively, a useful property for integrity
> could be for example that the content can be accessed/modified by only
> one process. No other (possibly malicious) processes can tamper with
> that file.
> 
> So, it is true, to make this property immutable more hooks are needed.
> But should it be something that IPE does? Or it should be done by an
> external component (another LSM) that does the enforcement and reports
> to IPE that the property is true? Theoretically (with a proper policy),
> existing LSMs could be used for that purpose too.
> 
> I would say more the second, it should not be IPE job, so that IPE can
> exclusively focus on evaluating properties, not making sure that the
> properties are immutable.
> 
> Roberto
> 
I think the issue here is not about the scope of IPE but the use cases
of IPE. 

We use IPE on fixed-function devices, which are completely locked down.
In our system, IPE denies all anonymous memory execution so memfd will
not work on our system.

Therefore, to make memfd useable with IPE we must add more properties.

-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

