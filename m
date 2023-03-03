Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C446AAC8D
	for <lists+linux-audit@lfdr.de>; Sat,  4 Mar 2023 21:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677963339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V+zztgfreJwDBCnuwvHFUcY78n3tW4keSy0D22cMoFY=;
	b=IvFVq0ofUVZ0W2E6rkL8FQMyYQtETmUSxHR3ix+80kcffJfThoBZowO7f5GLuKwjwAAN2W
	gcAX7qSYfaWFIFB72mtujK/2no/kOGGtQvDsmEsnhe1e78zF316xuS0dUfZHYpU33OfrRA
	LeHjEuhjJEWuCIFDnEuwqzA4usTUTTE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-bsM1lgFJMgmpRLE4HVcIWw-1; Sat, 04 Mar 2023 15:55:36 -0500
X-MC-Unique: bsM1lgFJMgmpRLE4HVcIWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B063810B02;
	Sat,  4 Mar 2023 20:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58B4F1121315;
	Sat,  4 Mar 2023 20:55:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43AC21949750;
	Sat,  4 Mar 2023 20:55:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39D3019465A0 for <linux-audit@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 15:24:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17BDE2026D2A; Fri,  3 Mar 2023 15:24:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1001B2026D4B
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 15:24:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59F61C05AAB
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 15:24:18 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-DirG9QnQN3616ywYcjxQ-g-1; Fri,
 03 Mar 2023 10:24:17 -0500
X-MC-Unique: DirG9QnQN3616ywYcjxQ-g-1
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 814BA4168F
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 15:17:55 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id
 i2-20020a056808054200b0037fa81b753bso1246328oig.12
 for <linux-audit@redhat.com>; Fri, 03 Mar 2023 07:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677856674;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoY182W3N/YgLN3GY7Mhnayi2HZrUWXw9KonFzXNONs=;
 b=tZVjOw+RHzbHlcvlvZwVHk3IwLh0JMki4HG1NVB8LTb0BCj8+SVPi2X+3j1sCPqVM0
 F45YPB6u79aj/DTcZ3dBX6f51WFmNAQWGKtEWCdtnSY2UxvrWVKWODR2N6T0wbZDd1mG
 Ji6v7vGnu5GlLzLKu9eTlaGJqbkIIVKaZAHJFiv6x7NqZIOMHaauP5r9PwjBv5D18n8f
 LSSU0hvZWdqLvvmQMAn+yaHv8qmOl0vmPv13OOj75IZmrTndYFVKUxhGmx3+yT33l4Oj
 jx6XYylWKWavuug6o62hnaJLumP9+7l7QDIQd7a0hfldRNW8bJhkD0ftYyFQU/UBwlKd
 WW0A==
X-Gm-Message-State: AO0yUKVC93vvb97npdNw8WXHP+bGxKiNxfzpVMNe7B3u5SD5DvjuNCds
 ndNKtdU1RJJEbBoEX1nrvihPcRJEJvb+FcSDJZl4ofp17BdXBVTrAYpJu61ckQpch5dlELoxoQ2
 ownKsfLqrT4q9PbhqDXwEq7rAHMIB+Yz3gQ==
X-Received: by 2002:a05:6830:3141:b0:693:c3bb:863f with SMTP id
 c1-20020a056830314100b00693c3bb863fmr737154ots.36.1677856674743; 
 Fri, 03 Mar 2023 07:17:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/PKQ83eK9URlt2QCwkSOPgRVeT6tF04LtR0PS2UtGf9jWhQeI7XWeAL0pcz0dYcTO+HxSELg==
X-Received: by 2002:a05:6830:3141:b0:693:c3bb:863f with SMTP id
 c1-20020a056830314100b00693c3bb863fmr737133ots.36.1677856674422; 
 Fri, 03 Mar 2023 07:17:54 -0800 (PST)
Received: from ?IPv6:2804:1b3:a7c3:d46d:73b6:f440:93a4:30?
 ([2804:1b3:a7c3:d46d:73b6:f440:93a4:30])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a9d610c000000b0068664355604sm1170156otj.22.2023.03.03.07.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 07:17:54 -0800 (PST)
Message-ID: <00324ebf28f25ed18f81bb602d7f28fff2b4b7ec.camel@canonical.com>
Subject: Re: [PATCH v38 01/39] LSM: Identify modules by more than name
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com, 
 paul@paul-moore.com, linux-security-module@vger.kernel.org
Date: Fri, 03 Mar 2023 12:17:49 -0300
In-Reply-To: <20220927195421.14713-2-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-2-casey@schaufler-ca.com>
Organization: Canonical
User-Agent: Evolution 3.44.4-0ubuntu1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Sat, 04 Mar 2023 20:55:24 +0000
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkhCgpPbiBUdWUsIDIwMjItMDktMjcgYXQgMTI6NTMgLTA3MDAsIENhc2V5IFNjaGF1ZmxlciB3
cm90ZToKPiBDcmVhdGUgYSBzdHJ1Y3QgbHNtX2lkIHRvIGNvbnRhaW4gaWRlbnRpZnlpbmcgaW5m
b3JtYXRpb24KPiBhYm91dCBMaW51eCBTZWN1cml0eSBNb2R1bGVzIChMU01zKS4gQXQgaW5jZXB0
aW9uIHRoaXMgY29udGFpbnMKPiBhIHNpbmdsZSBtZW1iZXIsIHdoaWNoIGlzIHRoZSBuYW1lIG9m
IHRoZSBtb2R1bGUuIENoYW5nZSB0aGUKPiBzZWN1cml0eV9hZGRfaG9va3MoKSBpbnRlcmZhY2Ug
dG8gdXNlIHRoaXMgc3RydWN0dXJlLiBDaGFuZ2UKPiB0aGUgaW5kaXZpZHVhbCBtb2R1bGVzIHRv
IG1haW50YWluIHRoZWlyIG93biBzdHJ1Y3QgbHNtX2lkIGFuZAo+IHBhc3MgaXQgdG8gc2VjdXJp
dHlfYWRkX2hvb2tzKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2FzZXkgU2NoYXVmbGVyIDxjYXNl
eUBzY2hhdWZsZXItY2EuY29tPgo+IC0tLQo+IMKgaW5jbHVkZS9saW51eC9sc21faG9va3MuaMKg
wqDCoCB8IDExICsrKysrKysrKy0tCj4gwqBzZWN1cml0eS9hcHBhcm1vci9sc20uY8KgwqDCoMKg
wqAgfMKgIDYgKysrKystCj4gwqBzZWN1cml0eS9icGYvaG9va3MuY8KgwqDCoMKgwqDCoMKgwqAg
fCAxMSArKysrKysrKysrLQo+IMKgc2VjdXJpdHkvY29tbW9uY2FwLmPCoMKgwqDCoMKgwqDCoMKg
IHzCoCA2ICsrKysrLQo+IMKgc2VjdXJpdHkvbGFuZGxvY2svY3JlZC5jwqDCoMKgwqAgfMKgIDIg
Ky0KPiDCoHNlY3VyaXR5L2xhbmRsb2NrL2ZzLmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoHNl
Y3VyaXR5L2xhbmRsb2NrL3B0cmFjZS5jwqDCoCB8wqAgMiArLQo+IMKgc2VjdXJpdHkvbGFuZGxv
Y2svc2V0dXAuY8KgwqDCoCB8wqAgNCArKysrCj4gwqBzZWN1cml0eS9sYW5kbG9jay9zZXR1cC5o
wqDCoMKgIHzCoCAxICsKPiDCoHNlY3VyaXR5L2xvYWRwaW4vbG9hZHBpbi5jwqDCoCB8wqAgNyAr
KysrKystCj4gwqBzZWN1cml0eS9sb2NrZG93bi9sb2NrZG93bi5jIHzCoCA2ICsrKysrLQo+IMKg
c2VjdXJpdHkvc2FmZXNldGlkL2xzbS5jwqDCoMKgwqAgfMKgIDcgKysrKysrLQo+IMKgc2VjdXJp
dHkvc2VjdXJpdHkuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysrKy0tLS0tLQo+IMKgc2Vj
dXJpdHkvc2VsaW51eC9ob29rcy5jwqDCoMKgwqAgfMKgIDcgKysrKysrLQo+IMKgc2VjdXJpdHkv
c21hY2svc21hY2tfbHNtLmPCoMKgIHzCoCA2ICsrKysrLQo+IMKgc2VjdXJpdHkvdG9tb3lvL3Rv
bW95by5jwqDCoMKgwqAgfMKgIDcgKysrKysrLQo+IMKgc2VjdXJpdHkveWFtYS95YW1hX2xzbS5j
wqDCoMKgwqAgfMKgIDYgKysrKystCj4gwqAxNyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sc21f
aG9va3MuaCBiL2luY2x1ZGUvbGludXgvbHNtX2hvb2tzLmgKPiBpbmRleCAzYWE2MDMwMzAyZjUu
LjIzMDU0ODgxZWIwOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oCj4g
KysrIGIvaW5jbHVkZS9saW51eC9sc21faG9va3MuaAo+IEBAIC0xNTk4LDYgKzE1OTgsMTMgQEAg
c3RydWN0IHNlY3VyaXR5X2hvb2tfaGVhZHMgewo+IMKgCSN1bmRlZiBMU01fSE9PSwo+IMKgfSBf
X3JhbmRvbWl6ZV9sYXlvdXQ7Cj4gwqAKPiArLyoKPiArICogSW5mb3JtYXRpb24gdGhhdCBpZGVu
dGlmaWVzIGEgc2VjdXJpdHkgbW9kdWxlLgo+ICsgKi8KPiArc3RydWN0IGxzbV9pZCB7Cj4gKwlj
b25zdCBjaGFyCSpsc207CQkvKiBOYW1lIG9mIHRoZSBMU00gKi8KPiArfTsKPiArCj4gwqAvKgo+
IMKgICogU2VjdXJpdHkgbW9kdWxlIGhvb2sgbGlzdCBzdHJ1Y3R1cmUuCj4gwqAgKiBGb3IgdXNl
IHdpdGggZ2VuZXJpYyBsaXN0IG1hY3JvcyBmb3IgY29tbW9uIG9wZXJhdGlvbnMuCj4gQEAgLTE2
MDYsNyArMTYxMyw3IEBAIHN0cnVjdCBzZWN1cml0eV9ob29rX2xpc3Qgewo+IMKgCXN0cnVjdCBo
bGlzdF9ub2RlCQlsaXN0Owo+IMKgCXN0cnVjdCBobGlzdF9oZWFkCQkqaGVhZDsKPiDCoAl1bmlv
biBzZWN1cml0eV9saXN0X29wdGlvbnMJaG9vazsKPiAtCWNvbnN0IGNoYXIJCQkqbHNtOwo+ICsJ
c3RydWN0IGxzbV9pZAkJCSpsc21pZDsKPiDCoH0gX19yYW5kb21pemVfbGF5b3V0Owo+IMKgCj4g
wqAvKgo+IEBAIC0xNjQxLDcgKzE2NDgsNyBAQCBleHRlcm4gc3RydWN0IHNlY3VyaXR5X2hvb2tf
aGVhZHMgc2VjdXJpdHlfaG9va19oZWFkczsKPiDCoGV4dGVybiBjaGFyICpsc21fbmFtZXM7Cj4g
wqAKPiDCoGV4dGVybiB2b2lkIHNlY3VyaXR5X2FkZF9ob29rcyhzdHJ1Y3Qgc2VjdXJpdHlfaG9v
a19saXN0ICpob29rcywgaW50IGNvdW50LAo+IC0JCQkJY29uc3QgY2hhciAqbHNtKTsKPiArCQkJ
wqDCoMKgwqDCoMKgIHN0cnVjdCBsc21faWQgKmxzbWlkKTsKPiDCoAo+IMKgI2RlZmluZSBMU01f
RkxBR19MRUdBQ1lfTUFKT1IJQklUKDApCj4gwqAjZGVmaW5lIExTTV9GTEFHX0VYQ0xVU0lWRQlC
SVQoMSkKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvYXBwYXJtb3IvbHNtLmMgYi9zZWN1cml0eS9h
cHBhcm1vci9sc20uYwo+IGluZGV4IGUyOWNhZGU3YjY2Mi4uYjcxZjdkNDE1OWQ3IDEwMDY0NAo+
IC0tLSBhL3NlY3VyaXR5L2FwcGFybW9yL2xzbS5jCj4gKysrIGIvc2VjdXJpdHkvYXBwYXJtb3Iv
bHNtLmMKPiBAQCAtMTIwMiw2ICsxMjAyLDEwIEBAIHN0cnVjdCBsc21fYmxvYl9zaXplcyBhcHBh
cm1vcl9ibG9iX3NpemVzIF9fbHNtX3JvX2FmdGVyX2luaXQgPSB7Cj4gwqAJLmxic190YXNrID0g
c2l6ZW9mKHN0cnVjdCBhYV90YXNrX2N0eCksCj4gwqB9Owo+IMKgCj4gK3N0YXRpYyBzdHJ1Y3Qg
bHNtX2lkIGFwcGFybW9yX2xzbWlkIF9fbHNtX3JvX2FmdGVyX2luaXQgPSB7Cj4gKwkubHNtwqDC
oMKgwqDCoCA9ICJhcHBhcm1vciIsCj4gK307Cj4gKwo+IMKgc3RhdGljIHN0cnVjdCBzZWN1cml0
eV9ob29rX2xpc3QgYXBwYXJtb3JfaG9va3NbXSBfX2xzbV9yb19hZnRlcl9pbml0ID0gewo+IMKg
CUxTTV9IT09LX0lOSVQocHRyYWNlX2FjY2Vzc19jaGVjaywgYXBwYXJtb3JfcHRyYWNlX2FjY2Vz
c19jaGVjayksCj4gwqAJTFNNX0hPT0tfSU5JVChwdHJhY2VfdHJhY2VtZSwgYXBwYXJtb3JfcHRy
YWNlX3RyYWNlbWUpLAo+IEBAIC0xODk3LDcgKzE5MDEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBh
cHBhcm1vcl9pbml0KHZvaWQpCj4gwqAJCWdvdG8gYnVmZmVyc19vdXQ7Cj4gwqAJfQo+IMKgCXNl
Y3VyaXR5X2FkZF9ob29rcyhhcHBhcm1vcl9ob29rcywgQVJSQVlfU0laRShhcHBhcm1vcl9ob29r
cyksCj4gLQkJCQkiYXBwYXJtb3IiKTsKPiArCQkJCSZhcHBhcm1vcl9sc21pZCk7Cj4gwqAKPiDC
oAkvKiBSZXBvcnQgdGhhdCBBcHBBcm1vciBzdWNjZXNzZnVsbHkgaW5pdGlhbGl6ZWQgKi8KPiDC
oAlhcHBhcm1vcl9pbml0aWFsaXplZCA9IDE7Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2JwZi9o
b29rcy5jIGIvc2VjdXJpdHkvYnBmL2hvb2tzLmMKPiBpbmRleCBlNTk3MWZhNzRmZDcuLmU1MGRl
M2FiZmRlMiAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9icGYvaG9va3MuYwo+ICsrKyBiL3NlY3Vy
aXR5L2JwZi9ob29rcy5jCj4gQEAgLTE1LDkgKzE1LDE4IEBAIHN0YXRpYyBzdHJ1Y3Qgc2VjdXJp
dHlfaG9va19saXN0IGJwZl9sc21faG9va3NbXSBfX2xzbV9yb19hZnRlcl9pbml0ID0gewo+IMKg
CUxTTV9IT09LX0lOSVQodGFza19mcmVlLCBicGZfdGFza19zdG9yYWdlX2ZyZWUpLAo+IMKgfTsK
PiDCoAo+ICsvKgo+ICsgKiBzbG90IGhhcyB0byBiZSBMU01CTE9CX05FRURFRCBiZWNhdXNlIHNv
bWUgb2YgdGhlIGhvb2tzCj4gKyAqIHN1cHBsaWVkIGJ5IHRoaXMgbW9kdWxlIHJlcXVpcmUgYSBz
bG90Lgo+ICsgKi8KPiArc3RydWN0IGxzbV9pZCBicGZfbHNtaWQgX19sc21fcm9fYWZ0ZXJfaW5p
dCA9IHsKPiArCS5sc23CoMKgwqDCoMKgID0gImJwZiIsCj4gK307CgpDYW4gYnBmX2xzbWlkIGJl
IHN0YXRpYyB0b28/Cgo+ICsKPiDCoHN0YXRpYyBpbnQgX19pbml0IGJwZl9sc21faW5pdCh2b2lk
KQo+IMKgewo+IC0Jc2VjdXJpdHlfYWRkX2hvb2tzKGJwZl9sc21faG9va3MsIEFSUkFZX1NJWkUo
YnBmX2xzbV9ob29rcyksICJicGYiKTsKPiArCXNlY3VyaXR5X2FkZF9ob29rcyhicGZfbHNtX2hv
b2tzLCBBUlJBWV9TSVpFKGJwZl9sc21faG9va3MpLAo+ICsJCQnCoMKgICZicGZfbHNtaWQpOwo+
IMKgCXByX2luZm8oIkxTTSBzdXBwb3J0IGZvciBlQlBGIGFjdGl2ZVxuIik7Cj4gwqAJcmV0dXJu
IDA7Cj4gwqB9CgpUaGFua3MKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRp
dEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXVkaXQK

