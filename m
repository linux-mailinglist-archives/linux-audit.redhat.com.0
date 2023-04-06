Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3966DA22D
	for <lists+linux-audit@lfdr.de>; Thu,  6 Apr 2023 22:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680811593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ExalPLZfbtaHDN3R/ajPLFPqUuWFDAiqJqmS4nJ1ymg=;
	b=guqp1y9oLhjP35H15koTWvjTTID0dHUuZuN6I3WcmutP6KtnvXZSzROd7wSUfu3R+86f58
	t5QuglZbQVhd5sNJzJzNpW54WIwJraW1tSjLKuwTvjXAst7GrRKlXX/EiCT+mtyTeI6pkH
	i5kJWkBqOCLQqAjW4HqfBrl39ir77R8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-seLT9sJvOVmh91joiogyGQ-1; Thu, 06 Apr 2023 16:05:47 -0400
X-MC-Unique: seLT9sJvOVmh91joiogyGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A3F5101A550;
	Thu,  6 Apr 2023 20:03:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C670F492C14;
	Thu,  6 Apr 2023 20:03:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9B6319465A2;
	Thu,  6 Apr 2023 20:03:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C82E194658F for <linux-audit@listman.corp.redhat.com>;
 Thu,  6 Apr 2023 19:20:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E562492C18; Thu,  6 Apr 2023 19:20:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26FA5492C14
 for <linux-audit@redhat.com>; Thu,  6 Apr 2023 19:20:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A50A1C05B07
 for <linux-audit@redhat.com>; Thu,  6 Apr 2023 19:20:13 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-215-qE6DOV8MM3CZ1BzHm2yOiA-1; Thu,
 06 Apr 2023 15:20:09 -0400
X-MC-Unique: qE6DOV8MM3CZ1BzHm2yOiA-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id EE920210DF13; Thu,  6 Apr 2023 12:20:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE920210DF13
Date: Thu, 6 Apr 2023 12:20:07 -0700
From: Fan Wu <wufan@linux.microsoft.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC PATCH v9 01/16] security: add ipe lsm
Message-ID: <20230406192007.GA19196@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-2-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhTtXC=HMUF8uak-29E__xLN2Kh_znn0xdRbm-GkgqBNiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTtXC=HMUF8uak-29E__xLN2Kh_znn0xdRbm-GkgqBNiA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 06 Apr 2023 20:03:29 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 02, 2023 at 02:00:48PM -0500, Paul Moore wrote:
> On Mon, Jan 30, 2023 at 5:58???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8a5c25c20d00..5e27e84763cc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10273,6 +10273,11 @@ T:     git git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
> >  F:     security/integrity/ima/
> >  F:     security/integrity/
> >
> > +INTEGRITY POLICY ENFORCEMENT (IPE)
> > +M:     Fan Wu <wufan@linux.microsoft.com>
> > +S:     Supported
> > +F:     security/ipe/
> 
> You should probably add a mailing list (L:) and source tree URL (T:)
> to the IPE entry.  You can use the LSM mailing list to start if you
> like, there are several LSMs that do that today, e.g. Smack, Landlock,
> etc.  As far as the source tree is concerned, probably the easiest
> option is a simple GitHub repo, but there are plenty of other choices
> too.
> 
> Both the mailing list and the source URLs can always be updated in the
> future so don't worry too much about being stuck with either long
> term.
> 
> --
> paul-moore.com

We do have a github repo, I will add that link in the next version.

-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

