Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 7745C31CFEA
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:12:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-OT2-Qz1UMbSiu5qCeq_Vbw-1; Tue, 16 Feb 2021 13:12:32 -0500
X-MC-Unique: OT2-Qz1UMbSiu5qCeq_Vbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97CAA1E561;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B3A760C15;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 636B218095CC;
	Tue, 16 Feb 2021 18:12:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AKg2ES013385 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 15:42:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 541322026D46; Wed, 10 Feb 2021 20:42:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B26B2026D11
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 20:42:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0281800B29
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 20:41:59 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-Ie0HeifCM4iYBvCul5dS3Q-1; Wed, 10 Feb 2021 15:41:57 -0500
X-MC-Unique: Ie0HeifCM4iYBvCul5dS3Q-1
Received: by mail-ej1-f47.google.com with SMTP id a9so6566189ejr.2
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 12:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1TFbf6wDysWFrfqmaORKAAxUEibFec9SK6l4jpShBLE=;
	b=DuLRkz+fbOSCFH+voMYF8Ew3ws50mr54bxA4WrE/nrvqcWLqHm/3/yivJDNde5fCmr
	9vOnBR0TOZLG+KwabQuD9BNwiLL8s+wLfFXSjO03cyeOlswdc7HsCxhaC4du3N1yvaHR
	xonkGW1oCk2/Z92gOTFKPFsMmtt17oY13p5dojIF+xCDnyEFsLCd9FSfS8AHdIINb9Dv
	UAMN2WUzi/07ZEoAA3aMKD9OZD9Y8DGUcWSCp1/swQyJYJlu9x5IzPpd/bYIty6KbCtH
	i3ssVaEAlFamPtjzrXlfNl+wlGOagF7WXM4resT/AOD51ovGOXR59J+1yyhqtc27aIvF
	MeCw==
X-Gm-Message-State: AOAM532zkGDh2AA2DJCj2rzlwjH4bEVSdyy1qa6AvaeDVR4VWIxlVhUc
	mOzjl7ZaI7z/jP28csXUeGeH9a7xxap5JOR3pwHUMVPyigh0GQ==
X-Google-Smtp-Source: ABdhPJze0hOn3LNPI+ESduOjh7mHySKCbKfy7V7/Ekvjp7BlejwYD7pSEnnPXSoWHZGoGmpIex/e6kxAw1gMSWTMBXo=
X-Received: by 2002:a17:906:af41:: with SMTP id
	ly1mr4608926ejb.525.1612989715773; 
	Wed, 10 Feb 2021 12:41:55 -0800 (PST)
MIME-Version: 1.0
From: Alan Evangelista <alan.vitor@gmail.com>
Date: Wed, 10 Feb 2021 17:41:45 -0300
Message-ID: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
Subject: Samba and AuditD
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: multipart/mixed; boundary="===============8929946711702815429=="

--===============8929946711702815429==
Content-Type: multipart/alternative; boundary="00000000000008fe3205bb016f62"

--00000000000008fe3205bb016f62
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have installed audit 2.8.5 on a CentOS 7 and set up the following rule in
/etc/audit/rules.d/audit.rules:

-w /data

/data is shared via Samba to a Windows Server 2016 system. If I write to
/data in the CentOS7 system, I get the open syscall event in the auditd
log. If I write to the same directory in the Windows Server 2016, I see the
file in the /data directory in the CentOS7 system, but the event is not
logged by audit. Is that the expected behavior?

Thanks in advance.

--00000000000008fe3205bb016f62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have installed audit 2.8.5 on a CentOS 7 and set up the =
following rule in /etc/audit/rules.d/audit.rules:<div><br></div><div>-w /da=
ta<br></div><div><br></div><div>/data is shared via Samba to a Windows Serv=
er 2016 system. If I write to /data in the CentOS7 system, I get the open s=
yscall event in the auditd log. If I write to the same directory in the Win=
dows Server 2016, I see the file in the /data directory in the CentOS7 syst=
em, but the event is not logged by audit. Is that the expected behavior?=C2=
=A0</div><div><br></div><div>Thanks in advance.</div></div>

--00000000000008fe3205bb016f62--

--===============8929946711702815429==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit
--===============8929946711702815429==--

