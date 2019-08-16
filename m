Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0ED905F1
	for <lists+linux-audit@lfdr.de>; Fri, 16 Aug 2019 18:36:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB87C2A09A0;
	Fri, 16 Aug 2019 16:36:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2CCC8F6DA;
	Fri, 16 Aug 2019 16:36:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CD381800202;
	Fri, 16 Aug 2019 16:36:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GGaUKZ003021 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 12:36:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 706052719C; Fri, 16 Aug 2019 16:36:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B48C27C4C
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 16:36:28 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38F98307D857
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 16:36:27 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x3so4498148lfc.0
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5lHpPSdCyT7Kyd9IXcFuqji9CoKFwycWngQ6LfdZfg0=;
	b=H5BhUsEHdQ5FzU5Gk3d5ZM8xImwWXVoWJAWrdM3kLZsOeJoUZ3avKESAh1tSeDZ6Ea
	hVTCFxGqXCkimDn7bP6MI3lVwNGcCDuB/i2EoTFkLFImYFh2pLggPXya/lJAbgxTYXXK
	J+qeWHgEB4zdRQtaHTstos5ShRNZY3RSuKs+rajrXYDjswCt179GXtFpHvriHjbNkpOm
	5rLot+GwHZvcR7cSBNSaOFe73ujrtrfrczpr7b24A0jQYXFechzoNzamh/kRq+4MtIk5
	5N3sYJi9TrrpnqevluuW3pQzGMuLqeZQcnwKjhPSXQlE/pM7kSShuu9j8krYJfDsnjgm
	yoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5lHpPSdCyT7Kyd9IXcFuqji9CoKFwycWngQ6LfdZfg0=;
	b=F+OIEC3LL26ulPgPFcEbhpoMv2zH9S/RE95EKhg2blJ4ptvJmLTHJmWNxR71POsIlG
	4kWFzpPFLOJEcz/3Ka7lLm6xHJiNppzHf88rZA6sSc/8QrjaLYK6uUi/b5v+KdlFP7pl
	fQhfwQ32S3NlEpCER7cTdYrV6+QtE0qL3DlTahfWDThE+zxPOX6DhMAGTiLf+Ka//JzS
	nWs01EhhUe/tfdnhu6u4mBkcWJM+Ril9JDJkwaJ/mFKp29zQGiw8Yhi9sEPAR+NZeiys
	bEnuXmT0FCePa0zjLPfYBASSpbYt+V9XxwPBMODfaOSwHZTe00J4xiuezqIvz14Opnw4
	DN8g==
X-Gm-Message-State: APjAAAVlu/Qllf024jwDfzNBW1nZwppsVREgO9q1n9YRVgWg5xSRMAJM
	3pXxT4jHsM6z0xBWH5tNADbBXq9P1wa9tBdMaj9R6RA=
X-Google-Smtp-Source: APXvYqzYbBGmvFQFm936ktOk3rwIm65aWylGP4lmnHHLscikOOcm/+ByQtnYFkBaH0Iqli70i/v+iW3RlhqE02ViCts=
X-Received: by 2002:ac2:5225:: with SMTP id i5mr4589867lfl.13.1565973385355;
	Fri, 16 Aug 2019 09:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190815202357.4238-1-acgoide@tycho.nsa.gov>
	<alpine.LRH.2.21.1908160817300.22623@namei.org>
	<cebacde0-5c53-c414-8f27-8d81ed928dfd@tycho.nsa.gov>
In-Reply-To: <cebacde0-5c53-c414-8f27-8d81ed928dfd@tycho.nsa.gov>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 16 Aug 2019 12:36:13 -0400
Message-ID: <CAHC9VhRLnUO_iiz31z=7wiHf2sNihC7mmi3FhaPCqmW=xt+tRw@mail.gmail.com>
Subject: Re: [RFC PATCH v3] security,
	capability: pass object information to security_capable
To: Stephen Smalley <sds@tycho.nsa.gov>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 16 Aug 2019 16:36:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 16 Aug 2019 16:36:27 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.261  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com, rgb@redhat.com,
	James Morris <jmorris@namei.org>,
	Aaron Goidel <acgoide@tycho.nsa.gov>, luto@amacapital.net,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Serge Hallyn <serge@hallyn.com>,
	nhfran2@tycho.nsa.gov
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 16 Aug 2019 16:36:37 +0000 (UTC)

On Fri, Aug 16, 2019 at 10:57 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 8/15/19 6:32 PM, James Morris wrote:
> > On Thu, 15 Aug 2019, Aaron Goidel wrote:
> >
> >> In SELinux this new information is leveraged here to perform an
> >> additional inode based check for capabilities relevant to inodes. Since
> >> the inode provided to capable_wrt_inode_uidgid() is a const argument,
> >> this also required propagating const down to dump_common_audit_data() and
> >> dropping the use of d_find_alias() to find an alias for the inode. This
> >> was sketchy to begin with and should be obsoleted by a separate change
> >> that will allow LSMs to trigger audit collection for all file-related
> >> information.
> >
> > Will the audit logs look the same once the 2nd patch is applied? We need
> > to be careful about breaking existing userland.
>
> It was already the case that the name= field in the AVC audit record was
> not guaranteed to be emitted in this case, since d_find_alias could
> return NULL.  And it was only a hint, since that name might have nothing
> to do with the name used to look up the inode in the first place. So I
> don't believe userland could have ever relied upon it being present
> here.  Removing it also fixes a problem with AVC audit generation under
> RCU walk; we should be able to drop the code that skips audit generation
> in that case with this d_find_alias call gone IIUC.
>
> With the ability for an LSM to enable collection and generation of
> AUDIT_PATH and other AUDIT_* records (which is made possible via the
> other patch), we will get more complete and relevant information in the
> audit log.  It won't look exactly the same (there will be separate AVC,
> PATH, ... records that can be correlated based on timestamp/serial and
> ausearch does this automatically for you).

Regardless of if it is The Right Thing, changes like this should
probably be put into a separate, unrelated patch.

I think there are a few things in dump_common_audit_data() that should
have been done differently, but unfortunately the audit records (and
IMHO the many stupid design decisions that went into them) are
effectively part of the kernel API and need to be treated with care.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
