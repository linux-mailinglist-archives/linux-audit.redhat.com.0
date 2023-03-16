Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F46E6BECDC
	for <lists+linux-audit@lfdr.de>; Fri, 17 Mar 2023 16:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679066853;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EqZapRZVwcwb+oj5jLNtp9DgMuPxccsOIcUMQiS/ySI=;
	b=dQt/sY7XEqsl3J3r25WUJVAGwUhBNDbUp4o2mS3ZPtBeChW9MCRTcTyfmdxBFRTZLDUaEM
	1UUiVtV6rKF01z+dUG9fgfJ98PoQRNpO784UYac6vMh8+vDEbN5mkhukTusqBJxpy53jqU
	co/s8Wme8YKl31ZYdtd2od4HSTChK5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-GvbabbEHNLCN7Ww9HvgQBg-1; Fri, 17 Mar 2023 11:27:28 -0400
X-MC-Unique: GvbabbEHNLCN7Ww9HvgQBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE41829DF9;
	Fri, 17 Mar 2023 15:27:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54CFC40C6E67;
	Fri, 17 Mar 2023 15:27:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE6501946A54;
	Fri, 17 Mar 2023 15:27:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B7DD1946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 16 Mar 2023 22:53:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D52540CFD41; Thu, 16 Mar 2023 22:53:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 565F640CFD40
 for <linux-audit@redhat.com>; Thu, 16 Mar 2023 22:53:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37E0529AA39C
 for <linux-audit@redhat.com>; Thu, 16 Mar 2023 22:53:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-640-b5Aq0cvsMiKrH-gkwn42Dg-1; Thu,
 16 Mar 2023 18:53:42 -0400
X-MC-Unique: b5Aq0cvsMiKrH-gkwn42Dg-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id EC6622057035; Thu, 16 Mar 2023 15:53:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC6622057035
Date: Thu, 16 Mar 2023 15:53:40 -0700
From: Fan Wu <wufan@linux.microsoft.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC PATCH v9 07/16] uapi|audit|ipe: add ipe auditing support
Message-ID: <20230316225340.GB22567@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-8-git-send-email-wufan@linux.microsoft.com>
 <3723852.kQq0lBPeGt@x2>
 <CAHC9VhRqMrTuvVtwzJoK2U=6O1QuaQ8ceA6+qm=6ib0TOUEeSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRqMrTuvVtwzJoK2U=6O1QuaQ8ceA6+qm=6ib0TOUEeSw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 17 Mar 2023 15:23:59 +0000
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
Cc: axboe@kernel.dk, linux-security-module@vger.kernel.org, tytso@mit.edu,
 corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org, dm-devel@redhat.com,
 linux-audit@redhat.com, linux-block@vger.kernel.org, eparis@redhat.com,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org, agk@redhat.com,
 serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 02, 2023 at 02:05:33PM -0500, Paul Moore wrote:
> On Tue, Jan 31, 2023 at 12:11???PM Steve Grubb <sgrubb@redhat.com> wrote:
> >
> > Hello,
> >
> > On Monday, January 30, 2023 5:57:22 PM EST Fan Wu wrote:
> > > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > >
> > > Users of IPE require a way to identify when and why an operation fails,
> > > allowing them to both respond to violations of policy and be notified
> > > of potentially malicious actions on their systens with respect to IPE
> > > itself.
> > >
> > > The new 1420 audit, AUDIT_IPE_ACCESS indicates the result of a policy
> > > evaulation of a resource. The other two events, AUDIT_MAC_POLICY_LOAD,
> > > and AUDIT_MAC_CONFIG_CHANGE represent a new policy was loaded into the
> > > kernel and the currently active policy changed, respectively.
> >
> > Typically when you reuse an existing record type, it is expected to maintain
> > the same fields in the same order. Also, it is expect that fields that are
> > common across diferent records have the same meaning. To aid in this, we have
> > a field dictionary here:
> >
> > https://github.com/linux-audit/audit-documentation/blob/main/specs/fields/
> > field-dictionary.csv
> >
> > For example, dev is expected to be 2 hex numbers separated by a colon which
> > are the device major and minor numbers. But down a couple lines from here, we
> > find dev="tmpfs". But isn't that a filesystem type?
> 
> What Steve said.
> 
> I'll also add an administrative note, we just moved upstream Linux
> audit development to a new mailing list, audit@vger.kernel.org, please
> use that in future patch submissions.  As a positive, it's a fully
> open list so you won't run into moderation delays/notifications/etc.
> 
Thanks for the info, I will update the address.

> > > This patch also adds support for success auditing, allowing users to
> > > identify how a resource passed policy. It is recommended to use this
> > > option with caution, as it is quite noisy.
> > >
> > > This patch adds the following audit records:
> > >
> > >   audit: AUDIT1420 path="/tmp/tmpwxmam366/deny/bin/hello" dev="tmpfs"
> > >     ino=72 rule="DEFAULT op=EXECUTE action=DENY"
> >
> > Do we really need to log the whole rule?
> 
> Fan, would it be reasonable to list the properties which caused the
> access denial?  That seems like it might be more helpful than the
> specific rule, or am I missing something?
> 
Audit the whole rule can let the user find the reason of a policy decision.
We need the whole rule because an allow/block is not caused by a specific
property, but the combination of all property conditions in a rule.

We could also add a verbose switch such that we only audit
the whole rule when a user turned the verbose switch on. 

-Fan

> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

