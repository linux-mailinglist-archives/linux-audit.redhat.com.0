Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5A46823BB0D
	for <lists+linux-audit@lfdr.de>; Tue,  4 Aug 2020 15:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596547264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DahIoSyN9OXkNOEIY+7dkhC4ziPAKwVyNT7IejSdia0=;
	b=ZOlXFtBbSUizYh1c5lAskJnq5h+WXdmn3JoGG4VKIJR38MFXl8xOoF0ONzxXnjyHUgxqoH
	9Aq2JA601SWUcjCMicoVNRtMqC++L4JUOpoS9QIt8JB9WI/peVwgNr+o3ZaqbcpVWA6u+u
	7CLteC9Wkh7Hm3yJrKVidoq5Y+WqbTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-heYB-dZtP6qTfhbhmeD9Tw-1; Tue, 04 Aug 2020 09:21:01 -0400
X-MC-Unique: heYB-dZtP6qTfhbhmeD9Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5F2100A8C6;
	Tue,  4 Aug 2020 13:20:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B764469512;
	Tue,  4 Aug 2020 13:20:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436BCA35BB;
	Tue,  4 Aug 2020 13:20:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074DKVnx032188 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 09:20:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4987F19C4F; Tue,  4 Aug 2020 13:20:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-192.phx2.redhat.com [10.3.112.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 104802857F;
	Tue,  4 Aug 2020 13:20:28 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Adding audit support to dpkg
Date: Tue, 04 Aug 2020 09:20:27 -0400
Message-ID: <2036494.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <20200803225049.GA511687@thunder.hadrons.org>
References: <20200803225049.GA511687@thunder.hadrons.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 074DKVnx032188
X-loop: linux-audit@redhat.com
Cc: Guillem Jover <guillem@debian.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

On Monday, August 3, 2020 6:50:49 PM EDT Guillem Jover wrote:
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

sure

>   * secondary field would be "sw_type" which would be =ABdpkg=BB.

yes

>   * field "op", which would contain entries different to rpm, such as
>     =ABunpack=BB, =ABconfigure=BB, =ABinstall=BB, =ABremove=BB, =ABpurge=
=BB, not sure if
>     that might be a problem?

>From compliance perspective, only install, update, and remove are relevant=
.=20
You want to know when something gets added or removed because they could ad=
d=20
setuid programs or daemons that autostart. Secondly, you may be tracking=20
current versions to resolve CVE's. So, for that purpose, you also want to=
=20
know when something gets updated. Nothing else matters.

How does unpack differ from install? How does purge differ from remove? The=
re=20
is another event type, AUDIT_USYS_CONFIG, that tracks user space configurat=
ion=20
changes. However, this is rarely used. Instead, what is done is watches are=
=20
placed on important configuration files to see if anything opens the file f=
or=20
modiciation. So, would there be any need to have a configuration option for=
=20
SOFTWARE_UPDATE?

>   * field "key_enforce", I take to denote whether a cryptographic
>     verification has been performed on the .deb archive? With values
>     =AB0=BB or =AB1=BB. (This would depend on whether debsig-verify(1) ha=
s
>     been configured to be executed or not.)

This denotes whether signature checks is being enforced. This is independen=
t=20
from whether or not the signature is valid. IOW, if a signature (next field=
)=20
is invalid, will the package be allowed in anyway?

>   * field "gpg_res", to denote whether the aforementioned verification
>     succeeded or not? With values =AB0=BB or =AB1=BB. And while dpkg can =
indeed
>     use GnuPG to verify signatures from archives, the name feels too
>     implementation specific, perhaps it could be renamed so that it
>     would not be very confusing, in case someone implements a check
>     based on say x509 certificates?

This field is whether or not the package passes its verification with a has=
h,=20
gpg signature, x509 certificate, or any other integrity scheme.

>   * field "root_dir", to denote the installation root directory, which
>     would map to dpkg --instdir value, with a value such as =AB"/"=BB.

Yes. Rpms can be relocatable to anywhere. So, this is to document what part=
=20
of the system the package will affect.

> Anything else I might have missed or might be worth taking into
> account while adding the support?

I think that's pretty much  it. If you wanted to see an example of the code=
,=20
it is here:

https://github.com/rpm-software-management/rpm/blob/master/plugins/
audit.c#L80

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

