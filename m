Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1733B102F65
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 23:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VOH4KBxxPWqNIvUSd597WVBO/zez/I3dURW+U2ZHK2I=;
	b=BFOk+vU6Fuk31sHx1/XRwmmiAAlwHXgb4pSVnKrKtSdOMqXYM7QVQM/Rknx5jm5hJK6KT/
	bw73N+WFt2a8meryx5SP6ChUFhZ90Agw6k+bQrfo3ju8gUIpTLC7fMxTv9JpxSR1sn5FN/
	BHgTQzlA+/Gj0j6poyNZjqIsZdkq2q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-_9_ODBiiN1-DiyF-P776VQ-1; Tue, 19 Nov 2019 17:33:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC9B1477;
	Tue, 19 Nov 2019 22:33:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36B566D29;
	Tue, 19 Nov 2019 22:33:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6BC718089C8;
	Tue, 19 Nov 2019 22:33:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMWtNQ009353 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:32:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F35E46E8F; Tue, 19 Nov 2019 22:32:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCA762926;
	Tue, 19 Nov 2019 22:32:46 +0000 (UTC)
Date: Tue, 19 Nov 2019 17:32:43 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
Subject: Re: Security audit rules
Message-ID: <20191119223243.inqd4yz5dsnr6gpg@madcap2.tricolour.ca>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-MC-Unique: _9_ODBiiN1-DiyF-P776VQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) wrote=
:
> Hi,
>=20
> In one of the VM I find audit.rules defined under /etc/audit as well as /=
etc/audit/rules.d.
>=20
> What is the significance as well as difference between the files found in=
 2 places.

You haven't said what distro you are using.  In more recent distros, the
rules in rules.d are used by augenrules to populate audit.rules,
overwriting them.

> Also please let me know what is the correct location where audit.rules ne=
ed to be places.

Depends on your distro.

> Vezhavendan K

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

