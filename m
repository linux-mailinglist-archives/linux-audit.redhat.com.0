Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFA3C5BE
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 10:14:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E4AF821CB;
	Tue, 11 Jun 2019 08:14:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1CC61001DEE;
	Tue, 11 Jun 2019 08:14:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9AD7206D1;
	Tue, 11 Jun 2019 08:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5B87PMm031134 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 04:07:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 901EB19729; Tue, 11 Jun 2019 08:07:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADFF19C70
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 08:07:23 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AF068552E
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 08:07:23 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id f189so296864wme.5
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 01:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WHWrvmaz/r/uPs6ClZNwktNqPw2BVBCjeEDlthzgcU8=;
	b=jS8sItXYXLX6KD5dSKcAKWWmFEiXAjg0IQiE1OftjVXtawLrf6eRMpw2YZxgexmgOt
	qCw+q2P3OIVI7uvLbxhQrnW1vAYULmTf9W9Sn3VtfbupozDIqPN9HLYufhPZyZhP7kpE
	XUJNELQ+Ei3GSCZHVdZmjnOz7d+YFMlCZN2PxT258PYfcmFCXZAHkaaHKqyDLXjsnwR9
	aqoP5bIiXfAxE2Szv1ZNXvIMfK++WUkDuqm6J9DDVOv9BzO765sOVVnuHEkhcbgpzFUY
	UP4tHCV7rlljkz9aMplPN3a0ghL5ngW6IGaJtB2g6qEZt5nQStXUOXGefYML7d4D6tT/
	y3Zg==
X-Gm-Message-State: APjAAAV280DO/c0HzENesh44mSAFoFf9klOQf0elw4GIcfKqzVY5TPj2
	lSg5HXAfjUcrd8EbLKJrg66yKwWOYjywGtH0DK2jxNuuYkRrJQVjajLekdi/nOctLrVzkrQQgEU
	Io+wOZ9Csv20x5iVOAUE=
X-Received: by 2002:adf:b643:: with SMTP id i3mr20919198wre.284.1560240441545; 
	Tue, 11 Jun 2019 01:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJCH1RG30C5HPYM3/363CUgEAM/3wWHHRnQ6oWWiIQBXXHTJfBuRDit6IqiagJ6r3cK6D2dg==
X-Received: by 2002:adf:b643:: with SMTP id i3mr20919171wre.284.1560240441294; 
	Tue, 11 Jun 2019 01:07:21 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10]) by smtp.gmail.com with ESMTPSA id
	h90sm29632411wrh.15.2019.06.11.01.07.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 01:07:20 -0700 (PDT)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>
Subject: [PATCH] selinux: log raw contexts as untrusted strings
Date: Tue, 11 Jun 2019 10:07:19 +0200
Message-Id: <20190611080719.28625-1-omosnace@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, stable@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 11 Jun 2019 08:14:42 +0000 (UTC)

VGhlc2Ugc3RyaW5ncyBtYXkgY29tZSBmcm9tIHVudHJ1c3RlZCBzb3VyY2VzIChlLmcuIGZpbGUg
eGF0dHJzKSBzbyB0aGV5Cm5lZWQgdG8gYmUgcHJvcGVybHkgZXNjYXBlZC4KClJlcHJvZHVjZXI6
CiAgICAjIHNldGVuZm9yY2UgMAogICAgIyB0b3VjaCAvdG1wL3Rlc3QKICAgICMgc2V0ZmF0dHIg
LW4gc2VjdXJpdHkuc2VsaW51eCAtdiAna3XFmWVjw60gxZnDrXplaycgL3RtcC90ZXN0CiAgICAj
IHJ1bmNvbiBzeXN0ZW1fdTpzeXN0ZW1fcjpzc2hkX3Q6czAgY2F0IC90bXAvdGVzdAogICAgKGxv
b2sgYXQgdGhlIGdlbmVyYXRlZCBBVkNzKQoKQWN0dWFsIHJlc3VsdDoKICAgIHR5cGU9QVZDIFsu
Li5dIHRyYXdjb249a3XFmWVjw60gxZnDrXplawoKRXhwZWN0ZWQgcmVzdWx0OgogICAgdHlwZT1B
VkMgWy4uLl0gdHJhd2Nvbj02Qjc1QzU5OTY1NjNDM0FEMjBDNTk5QzNBRDdBNjU2QgoKRml4ZXM6
IGZlZGUxNDgzMjRjMyAoInNlbGludXg6IGxvZyBpbnZhbGlkIGNvbnRleHRzIGluIEFWQ3MiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY1LjErClNpZ25lZC1vZmYtYnk6IE9uZHJlaiBN
b3NuYWNlayA8b21vc25hY2VAcmVkaGF0LmNvbT4KLS0tCiBzZWN1cml0eS9zZWxpbnV4L2F2Yy5j
IHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zZWN1cml0eS9zZWxpbnV4L2F2Yy5jIGIvc2VjdXJpdHkv
c2VsaW51eC9hdmMuYwppbmRleCA4MzQ2YTRmN2M1ZDcuLmE5OWJlNTA4ZjkzZCAxMDA2NDQKLS0t
IGEvc2VjdXJpdHkvc2VsaW51eC9hdmMuYworKysgYi9zZWN1cml0eS9zZWxpbnV4L2F2Yy5jCkBA
IC03MzksMTQgKzczOSwyMCBAQCBzdGF0aWMgdm9pZCBhdmNfYXVkaXRfcG9zdF9jYWxsYmFjayhz
dHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwgdm9pZCAqYSkKIAlyYyA9IHNlY3VyaXR5X3NpZF90b19j
b250ZXh0X2ludmFsKHNhZC0+c3RhdGUsIHNhZC0+c3NpZCwgJnNjb250ZXh0LAogCQkJCQkgICAm
c2NvbnRleHRfbGVuKTsKIAlpZiAoIXJjICYmIHNjb250ZXh0KSB7Ci0JCWF1ZGl0X2xvZ19mb3Jt
YXQoYWIsICIgc3Jhd2Nvbj0lcyIsIHNjb250ZXh0KTsKKwkJaWYgKHNjb250ZXh0X2xlbiAmJiBz
Y29udGV4dFtzY29udGV4dF9sZW4gLSAxXSA9PSAnXDAnKQorCQkJc2NvbnRleHRfbGVuLS07CisJ
CWF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgc3Jhd2Nvbj0iKTsKKwkJYXVkaXRfbG9nX25fdW50cnVz
dGVkc3RyaW5nKGFiLCBzY29udGV4dCwgc2NvbnRleHRfbGVuKTsKIAkJa2ZyZWUoc2NvbnRleHQp
OwogCX0KIAogCXJjID0gc2VjdXJpdHlfc2lkX3RvX2NvbnRleHRfaW52YWwoc2FkLT5zdGF0ZSwg
c2FkLT50c2lkLCAmc2NvbnRleHQsCiAJCQkJCSAgICZzY29udGV4dF9sZW4pOwogCWlmICghcmMg
JiYgc2NvbnRleHQpIHsKLQkJYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiB0cmF3Y29uPSVzIiwgc2Nv
bnRleHQpOworCQlpZiAoc2NvbnRleHRfbGVuICYmIHNjb250ZXh0W3Njb250ZXh0X2xlbiAtIDFd
ID09ICdcMCcpCisJCQlzY29udGV4dF9sZW4tLTsKKwkJYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiB0
cmF3Y29uPSIpOworCQlhdWRpdF9sb2dfbl91bnRydXN0ZWRzdHJpbmcoYWIsIHNjb250ZXh0LCBz
Y29udGV4dF9sZW4pOwogCQlrZnJlZShzY29udGV4dCk7CiAJfQogfQotLSAKMi4yMC4xCgotLQpM
aW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=
