Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7469E23BA30
	for <lists+linux-audit@lfdr.de>; Tue,  4 Aug 2020 14:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596543771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s8UZcmtvKMSDbFsOEv3zuCe5XkdMPb+W5ZQrOvu2qN0=;
	b=cp6jsKY/wnpIJTRkBdVQfPVf5wR7kTpMy06dbCf+O+8PZjqxd3K/3AZ0F1NgH8E6kgbsW4
	m4FOys5aXVX/eA05R5ZPcLDUcR1sEcLt+6Jfor2yrlSrIaqO9WrsBmt4IWAWz7A8k4pvx2
	zgRG9YqP/Ft5BMhNrFfpmIhle/mjk/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-8K3TtLXfMsy2ysusgfcEiQ-1; Tue, 04 Aug 2020 08:22:49 -0400
X-MC-Unique: 8K3TtLXfMsy2ysusgfcEiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD6B8101C8A0;
	Tue,  4 Aug 2020 12:22:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B28BA607A1;
	Tue,  4 Aug 2020 12:22:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CEC39A103;
	Tue,  4 Aug 2020 12:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074CMUF2025014 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 08:22:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9917D5C6DD; Tue,  4 Aug 2020 12:22:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 353AD69314;
	Tue,  4 Aug 2020 12:22:23 +0000 (UTC)
Date: Tue, 4 Aug 2020 08:22:21 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Guillem Jover <guillem@debian.org>
Subject: Re: Adding audit support to dpkg
Message-ID: <20200804122221.vjqioy35dho2iwf3@madcap2.tricolour.ca>
References: <20200803225049.GA511687@thunder.hadrons.org>
MIME-Version: 1.0
In-Reply-To: <20200803225049.GA511687@thunder.hadrons.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2020-08-04 00:50, Guillem Jover wrote:
> Hi!
>=20
> We got a request to add audit support to dpkg [R], and as initially
> mentioned on the bug report it seems the AUDIT_SOFTWARE_UPDATE format
> does not appear to be documented, so while looking into all this, got
> several questions.
>=20
>   [R] <https://bugs.debian.org/931748>
>=20
> >From the rpm implementation and auparse/normalize.c I gather that it
> would contain the following fields, applied to dpkg:
>=20
>   * primary field would be "sw" which would contain something like
>     =AB"nginx_1.18.0-5_amd64"=BB, I assume that the format differing from
>     the one in rpm is fine as that would be keyed on the next field?
>   * secondary field would be "sw_type" which would be =ABdpkg=BB.
>   * field "op", which would contain entries different to rpm, such as
>     =ABunpack=BB, =ABconfigure=BB, =ABinstall=BB, =ABremove=BB, =ABpurge=
=BB, not sure if
>     that might be a problem?
>   * field "key_enforce", I take to denote whether a cryptographic
>     verification has been performed on the .deb archive? With values
>     =AB0=BB or =AB1=BB. (This would depend on whether debsig-verify(1) ha=
s
>     been configured to be executed or not.)
>   * field "gpg_res", to denote whether the aforementioned verification
>     succeeded or not? With values =AB0=BB or =AB1=BB. And while dpkg can =
indeed
>     use GnuPG to verify signatures from archives, the name feels too
>     implementation specific, perhaps it could be renamed so that it
>     would not be very confusing, in case someone implements a check
>     based on say x509 certificates?
>   * field "root_dir", to denote the installation root directory, which
>     would map to dpkg --instdir value, with a value such as =AB"/"=BB.
>=20
> Anything else I might have missed or might be worth taking into
> account while adding the support?

I don't see any glaring issues with what you propose.  In particular,
the op field seems fine, sticking to single words with no spaces.

You might review these two documents to check for details:
=09https://github.com/linux-audit/audit-documentation/wiki/SPEC-Writing-Goo=
d-Events

And check here to see if there are already fields that are set aside for
these uses and make sure there isn't a conflict of type or meaning for
an existing one:
=09https://github.com/linux-audit/audit-documentation/blob/master/specs/fie=
lds/field-dictionary.csv

Other documents in this set might be helpful:
=09https://github.com/linux-audit/audit-documentation/wiki

> Guillem

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

