Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5727D4E73C
	for <lists+linux-audit@lfdr.de>; Fri, 21 Jun 2019 13:38:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BDF8308FC4D;
	Fri, 21 Jun 2019 11:37:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 231846014C;
	Fri, 21 Jun 2019 11:37:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85873206D2;
	Fri, 21 Jun 2019 11:37:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LBYZcM025491 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 07:34:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91F7A6014C; Fri, 21 Jun 2019 11:34:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C55A604CF
	for <linux-audit@redhat.com>; Fri, 21 Jun 2019 11:34:29 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D53B3086203
	for <linux-audit@redhat.com>; Fri, 21 Jun 2019 11:34:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id k20so96384ios.10
	for <linux-audit@redhat.com>; Fri, 21 Jun 2019 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=acalvio-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=gV7M1z+uVjMY+qDZ1fPud7tC3bLMTNnY3InTt68HK6U=;
	b=hS/mjwbb2LD021TdTD8EDAs1mDl/oCqkUIPsgSR55seHp9rk85tsjziCyfpOViFdin
	eBD/wd6HNefj6lfHKcuiwq0AmA7BPpgkX+p5saPKRRTKLMUh0mF9X6P/D+q38izMIquA
	iOAnaXoEDx6pxocNtH9dxSOYLXz4mkR0XAIVv3W3t/Bm5K7P6N108pW2juEFd1+GfP1m
	P+1fJ2CDZG7MFRwoaGOzWS/I5/oCeXYBVvuSIhWNxv9tnvL2no2+yS4bCkcZrgSOI99J
	MuqbiR5hzrqy+ZH7ijRmtbMBHfMwBJ1kqBMvqcvXvHgTvk4cKOm0Bi1dLVsVGiDNtV57
	17sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gV7M1z+uVjMY+qDZ1fPud7tC3bLMTNnY3InTt68HK6U=;
	b=odfy4EYFAlX/P7d6YvzDHne47coYsvhfy2s903K4Qf3IUND+CgyQPj9y9mC9FYx0+H
	CLjygYtT+5Z7bn3qor8g58B272ej4smxdQfMbBN/cda5rQDUUwUOrJXUTbm+n2I+lCk3
	r+1St5M+Tt48ng8bGPj6bf3SZUb/sgQLNioD3TyBS04bUCkfScs5y8bS9Zue3a+DjEeW
	40pdV7gX1YmBmhe4dznZ+JUF+F9bKNyo+kX6VC196HV3UXfUkVMb4Mx+wlDXu7SyO6I0
	WjumKdmhw7eBMljqEbm0pE1dxXxfW53Z4PqXgUFtlTMBE3/TiLHF5cJpDpzrAOQyjYbH
	GQRQ==
X-Gm-Message-State: APjAAAW1pbs9D7Qd9Cu/2TklvzHcOYttZFQt1u+2UMP1Ux5Y0QonyObI
	xebtERFpj49plzPAB2rjsHN2MH3wKeiv5W+mML4NrjpVs3A=
X-Google-Smtp-Source: APXvYqwKeGKH1/60MiP+bYcZ1FOjVXCL1hkmEZsQHiIocE4u73o50HuWoyYTH24+bG7IOW76CGQWDx9u4O3udd1pcqY=
X-Received: by 2002:a02:b395:: with SMTP id p21mr22868811jan.31.1561116863095; 
	Fri, 21 Jun 2019 04:34:23 -0700 (PDT)
MIME-Version: 1.0
From: Tarun Ramesh <tramesh@acalvio.com>
Date: Fri, 21 Jun 2019 17:04:12 +0530
Message-ID: <CAFQMB-Xnu+sLdi=v7ybPYogoa=_zWmkLsAvVpEK3frwXEui6RQ@mail.gmail.com>
Subject: Possible memory leak in auparse_interpret_sock_parts()
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 11:34:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 11:34:26 +0000 (UTC) for IP:'209.85.166.45'
	DOMAIN:'mail-io1-f45.google.com' HELO:'mail-io1-f45.google.com'
	FROM:'tramesh@acalvio.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.45 mail-io1-f45.google.com 209.85.166.45
	mail-io1-f45.google.com <tramesh@acalvio.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2949689985818164475=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 21 Jun 2019 11:38:00 +0000 (UTC)

--===============2949689985818164475==
Content-Type: multipart/alternative; boundary="00000000000013fa5e058bd3d836"

--00000000000013fa5e058bd3d836
Content-Type: text/plain; charset="UTF-8"

Hi,

In the function auparse_interpret_sock_parts() in auparse/auparse.c, for
the line:
const char *val = nvlist_interp_cur_val(r, au->escape_mode);

I see that the function nvlist_interp_cur_val() eventually calls
auparse_do_interpretation() which has the comment "Returns a malloc'ed
buffer that the caller must free"
The call path is:
nvlist_interp_cur_val() -> interpret() -> auparse_do_interpretation()

In auparse_interpret_sock_parts():
const char *val = nvlist_interp_cur_val(r, au->escape_mode);
is called and then the value of 'val' is overwritten by:
val = strstr(tmp, field);

The initial memory pointed to by 'val' is never freed, which might be a
memory leak.
Please let me know if I;m missing something.

Thanks,
Tarun

--00000000000013fa5e058bd3d836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>In the function auparse_=
interpret_sock_parts() in auparse/auparse.c, for the line:</div><div>const =
char *val =3D nvlist_interp_cur_val(r, au-&gt;escape_mode);</div><div><br><=
/div><div>I see that the function nvlist_interp_cur_val() eventually calls =
auparse_do_interpretation() which has the comment &quot;Returns a malloc&#3=
9;ed buffer that the caller must free&quot;</div><div>The call path is:<br>=
</div><div>nvlist_interp_cur_val() -&gt; interpret() -&gt; auparse_do_inter=
pretation()</div><div><br></div><div>In auparse_interpret_sock_parts():</di=
v><div>const char *val =3D nvlist_interp_cur_val(r, au-&gt;escape_mode); <b=
r></div><div>is called and then the value of &#39;val&#39; is overwritten b=
y:</div><div>val =3D strstr(tmp, field);</div><div><br></div><div>The initi=
al memory pointed to by &#39;val&#39; is never freed, which might be a memo=
ry leak.</div><div>Please let me know if I;m missing something.</div><div><=
br></div><div>Thanks,</div><div>Tarun<br></div></div>

--00000000000013fa5e058bd3d836--


--===============2949689985818164475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2949689985818164475==--

