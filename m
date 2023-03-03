Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18F6A9C65
	for <lists+linux-audit@lfdr.de>; Fri,  3 Mar 2023 17:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677862353;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FS5XgZ6acUjBxfgR2qcb60UyuIc7UxLR0dM+8uwa26A=;
	b=aYYBcTs2vUcRzwLbHw+/k0FiA4XWE7kDZD530xN9WlSUuRwMcK0R4dYORRYi7iaOy1oM7K
	LQDFyCewL7oL/aqbS8014SzGejx+c4wPrFQBl8ai7S2Nml5CnN9Pdn1qOeNjC/NmyHwMmC
	5/xLr2Ha0IGY+47OhyPkjJXJz4fS7Qc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-XstzcmexNWSzlSvCcju7Rw-1; Fri, 03 Mar 2023 11:52:29 -0500
X-MC-Unique: XstzcmexNWSzlSvCcju7Rw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAD72857A89;
	Fri,  3 Mar 2023 16:52:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2FCD492B00;
	Fri,  3 Mar 2023 16:52:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 081F01948642;
	Fri,  3 Mar 2023 16:52:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F51F19465A0 for <linux-audit@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 16:52:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0299A492C1B; Fri,  3 Mar 2023 16:52:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF92492C14
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 16:52:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D07ED858F0E
 for <linux-audit@redhat.com>; Fri,  3 Mar 2023 16:52:16 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
 (sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-8R1pHK06Pj25nrUAJhdF2Q-1; Fri,
 03 Mar 2023 11:52:15 -0500
X-MC-Unique: 8R1pHK06Pj25nrUAJhdF2Q-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1677862334; bh=Wt84xw3yUNo4+cEyVfGMlAI+yJyzoT9hOzAeQb+J7w4=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=AtaIH2KhhFjcRPavpH0hNfaHcr1AdqBebH4+9V+khm3a0hWVpD4PzYKqSlWtmAdakt+AMBOtb/qg79CJD2t0j8FJd86c8eptY28M/kpWsdRHsol3KhGO6p0HF8uvKf0MXD7YfYus2W9HQEBGfD9gEEoAkMgOB6CAOWXni0OuB7YVqF5TtvN1vQPR2z04cXl+GfEP0mQ4gqMoWodRuUEZKoPJE+Y9ysy6qkQFw4kwEf0V7ZoAwIx5zm8gx1NBuLWXyZPY2gFaAmGTMsPswBkpbQs85mnIOLA8fE/8JYLOekEPsHgSf7HHRFrpvLMiQdA7s5HdC8p1IuC6mD2B7zy6ow==
X-YMail-OSG: 3sK.Gg8VM1n9A840XATdBnm9T._HZs1j.Shh7q1sDZN27n_F3W05oq970YkBblt
 Xyo7b54r4KImlZuOlH6II1AgMUiKjTriaLHX0m50oil..mo1e9C95SOfHRuv3wceSnJYfz4de9b3
 slumAj6yHYtEEsCRFoJNa3i5CTyKiD64yStHX_qBRXmdnC9GRzqSLP7HG.99hs38kgnUSBz_vPLb
 zk0y7VngZyKxH4yDjJxD.vRHX3GY8DHu9Q0YA15__R6cH3k7SHMqveK41ZfQM_U.bsksxMqiZQ4u
 ojUsAkF4qQHBfhexk56fuCvLB4Wx2Zl72dc.8JIxvUOTwUp6Euec10jgkFPx913cV3DLimCo.roB
 mJkaKNQgogOH4jle6XRfdeyun4AgSgMc3WoFFQ3VHuSWU2NgeNdbtTCrLKYs12nunahqhedhpOzP
 3prso9LhPkw_7YIoghnX7CdFXM3QhYYDB578m3kYj5BHKTfSwGZmIeREd0IfzmPeyKtl6rJPWytQ
 qPi4h5Xoc7z9gJhC0NmKMj6cm9hKH7a8FPCyWYWyonj.sbCEdQ4MSo9UlDJtx_7y3t.HVdiRDgY0
 nbm3D8.qMXetU6r37Foi1nnOv8P4N8xsK.WPKKw3508s3iUlYVx9SyXXK5c173zEqskHXLeuc8lc
 yZcD1ClPiTcGqu4VNcg4u_j_6Y627Hv6SHqVP_qxCHERP89EcHIiQsDdm00BPvee.el3D8mWB2Aw
 uha7N8X0rnXJYTW4TuNqasWa_gW1XRrZWVoAwav8NabNQZ_JkNy0Aem76KREAaZrdxJMfddy8lsI
 5c7xMsxXNqucPwNqIYtPZA30vXk7aax.Z.hVDab7ZbLT_0WKbgYJVvm_2fNi_zKb7w.u26vRzogN
 ld_l74fF3plUddy_YHiFywS3IBKeJDy.Ywy2ekwrtV18xJFfhZDPsOl3uwv03WE2F3TZku_OfZkj
 J7LCmQqCXNyD3nFGEVS1EQpEZ4xmHW_MXaU9589iVXDOAe2hRzLzlYA851u_sIp4L_1bqJGTdpz3
 3tdExTzteblKaP0bthn29KB5TY2tSotkAjV7O5SXEfRLfzpzrWr2w6jVIMDpEtK.b1IdVXco.aSC
 yUDfoK3OY7jN9plv98rQl85UMsBq8kGiozDOLKa44mAmDs_CqZJb2bgGjp8rG2pTiWoYGZe_zrCY
 aUoiumF4eg3JueIGYMXCKm8txNzrIl35Wk87JTq_9cSIa4FZlEo4gN10kQm4OUCAPP8k7492GtaN
 y9r6G_LNxHkY6CPHh4BLz6Q4zcFVrjF5olYKDqqsh4QPORRGX8C_OFME.h7Orb8f8I1Rj.htY7lA
 XKzPp.uM0esEYKkJCkKCs.GyhvXQ_w2uDDFn2dfMsstBVfGHmkPXvZSxicRSURXWxYGt3gn4r9Tk
 zmF6ytJF6rZ.F.eHNEbPCGMOK2L3wxTT9WB810CO5St0e8HpFIdN5DG72MtGzQsbaxUXxj2QbFyS
 QcQsjFTAhZTjqxJujteLitQrKfmvDJXPCgH09afES8IP118vAOMQOXjOZTT.0no4X.Ah7N..mhVc
 d2Aqq1kalWl08R1dBRn389E21_bEMHNGfy0n3zmd.i8fr9wub9bJ8YmUkrF2EMDD8hJfahDFG8Nw
 xeLEz52KDHOUozBzjqepl8msMgPcyYEQQrj1QS3l_AI.nMb8SMMExPj2eMhzRao5Wvs2GuoxX2um
 Is9pR0ZWHReMYoGymVGKx890upRpcaQOU6ZoyVkF0qzNYyA8U5npvrL4wXC6K7misXQhjWjA.M3l
 d_9qSzorFjH_9BSO1QBoAV4iLxmPQmd0STMQsZWmpX4NFGN1UzivHEa10QQac86A8NFtCuxS0nvE
 CtUS.4hLdjDhbeLHELedfKaxjoxzxJJ_j_D8dh2cdDO7ABqr2SmEjU6_94omeQCvo7HHwe44J4Xy
 .T0fYJbhCAeOVz3NOIzdlVqwnYFZZwPJe7.XAEFFRp.sXfHy4nDzjnCFZ7wEVA0kWjvokC_rzCui
 K66M_QzeFC9PZfIcyYPq09zdDDho_aI04fYl_oTOxRzzwRG.KrFojwn0Z_d2AhdwGcFsf8Q08cCW
 2sVbxSX17SMbMHFKR__L8xKE3H0_rFvV08R30Ba3aZUgUraWyjZuRAFMd2EsBsC4qo_lhoyu0jR0
 4zlY6RkLonGYYK2l3taf96D.rbKGm4s.4AZfDCTO87.Sp1P.CFw5YRwbQ9syM4CL0argymD2Ifer
 nddpWp9sznS2843nsWWzrg.onXBcOFQ--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Fri, 3 Mar 2023 16:52:14 +0000
Received: by hermes--production-bf1-777648578f-wvft9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0866191a97a404250aa1a9ba4b9ea781; 
 Fri, 03 Mar 2023 16:52:09 +0000 (UTC)
Message-ID: <0776a8b5-360b-6da5-fbd2-205b82b24010@schaufler-ca.com>
Date: Fri, 3 Mar 2023 08:52:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v38 01/39] LSM: Identify modules by more than name
To: Georgia Garcia <georgia.garcia@canonical.com>, casey.schaufler@intel.com, 
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-2-casey@schaufler-ca.com>
 <00324ebf28f25ed18f81bb602d7f28fff2b4b7ec.camel@canonical.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <00324ebf28f25ed18f81bb602d7f28fff2b4b7ec.camel@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8zLzIwMjMgNzoxNyBBTSwgR2VvcmdpYSBHYXJjaWEgd3JvdGU6Cj4gSGkhCj4KPiBPbiBU
dWUsIDIwMjItMDktMjcgYXQgMTI6NTMgLTA3MDAsIENhc2V5IFNjaGF1ZmxlciB3cm90ZToKPj4g
Q3JlYXRlIGEgc3RydWN0IGxzbV9pZCB0byBjb250YWluIGlkZW50aWZ5aW5nIGluZm9ybWF0aW9u
Cj4+IGFib3V0IExpbnV4IFNlY3VyaXR5IE1vZHVsZXMgKExTTXMpLiBBdCBpbmNlcHRpb24gdGhp
cyBjb250YWlucwo+PiBhIHNpbmdsZSBtZW1iZXIsIHdoaWNoIGlzIHRoZSBuYW1lIG9mIHRoZSBt
b2R1bGUuIENoYW5nZSB0aGUKPj4gc2VjdXJpdHlfYWRkX2hvb2tzKCkgaW50ZXJmYWNlIHRvIHVz
ZSB0aGlzIHN0cnVjdHVyZS4gQ2hhbmdlCj4+IHRoZSBpbmRpdmlkdWFsIG1vZHVsZXMgdG8gbWFp
bnRhaW4gdGhlaXIgb3duIHN0cnVjdCBsc21faWQgYW5kCj4+IHBhc3MgaXQgdG8gc2VjdXJpdHlf
YWRkX2hvb2tzKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlA
c2NoYXVmbGVyLWNhLmNvbT4KPj4gLS0tCj4+IMKgaW5jbHVkZS9saW51eC9sc21faG9va3MuaMKg
wqDCoCB8IDExICsrKysrKysrKy0tCj4+IMKgc2VjdXJpdHkvYXBwYXJtb3IvbHNtLmPCoMKgwqDC
oMKgIHzCoCA2ICsrKysrLQo+PiDCoHNlY3VyaXR5L2JwZi9ob29rcy5jwqDCoMKgwqDCoMKgwqDC
oCB8IDExICsrKysrKysrKystCj4+IMKgc2VjdXJpdHkvY29tbW9uY2FwLmPCoMKgwqDCoMKgwqDC
oMKgIHzCoCA2ICsrKysrLQo+PiDCoHNlY3VyaXR5L2xhbmRsb2NrL2NyZWQuY8KgwqDCoMKgIHzC
oCAyICstCj4+IMKgc2VjdXJpdHkvbGFuZGxvY2svZnMuY8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+
PiDCoHNlY3VyaXR5L2xhbmRsb2NrL3B0cmFjZS5jwqDCoCB8wqAgMiArLQo+PiDCoHNlY3VyaXR5
L2xhbmRsb2NrL3NldHVwLmPCoMKgwqAgfMKgIDQgKysrKwo+PiDCoHNlY3VyaXR5L2xhbmRsb2Nr
L3NldHVwLmjCoMKgwqAgfMKgIDEgKwo+PiDCoHNlY3VyaXR5L2xvYWRwaW4vbG9hZHBpbi5jwqDC
oCB8wqAgNyArKysrKystCj4+IMKgc2VjdXJpdHkvbG9ja2Rvd24vbG9ja2Rvd24uYyB8wqAgNiAr
KysrKy0KPj4gwqBzZWN1cml0eS9zYWZlc2V0aWQvbHNtLmPCoMKgwqDCoCB8wqAgNyArKysrKyst
Cj4+IMKgc2VjdXJpdHkvc2VjdXJpdHkuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysrKy0t
LS0tLQo+PiDCoHNlY3VyaXR5L3NlbGludXgvaG9va3MuY8KgwqDCoMKgIHzCoCA3ICsrKysrKy0K
Pj4gwqBzZWN1cml0eS9zbWFjay9zbWFja19sc20uY8KgwqAgfMKgIDYgKysrKystCj4+IMKgc2Vj
dXJpdHkvdG9tb3lvL3RvbW95by5jwqDCoMKgwqAgfMKgIDcgKysrKysrLQo+PiDCoHNlY3VyaXR5
L3lhbWEveWFtYV9sc20uY8KgwqDCoMKgIHzCoCA2ICsrKysrLQo+PiDCoDE3IGZpbGVzIGNoYW5n
ZWQsIDgyIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9sc21faG9va3MuaCBiL2luY2x1ZGUvbGludXgvbHNtX2hvb2tzLmgKPj4g
aW5kZXggM2FhNjAzMDMwMmY1Li4yMzA1NDg4MWViMDggMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
bGludXgvbHNtX2hvb2tzLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9sc21faG9va3MuaAo+PiBA
QCAtMTU5OCw2ICsxNTk4LDEzIEBAIHN0cnVjdCBzZWN1cml0eV9ob29rX2hlYWRzIHsKPj4gwqAJ
I3VuZGVmIExTTV9IT09LCj4+IMKgfSBfX3JhbmRvbWl6ZV9sYXlvdXQ7Cj4+IMKgCj4+ICsvKgo+
PiArICogSW5mb3JtYXRpb24gdGhhdCBpZGVudGlmaWVzIGEgc2VjdXJpdHkgbW9kdWxlLgo+PiAr
ICovCj4+ICtzdHJ1Y3QgbHNtX2lkIHsKPj4gKwljb25zdCBjaGFyCSpsc207CQkvKiBOYW1lIG9m
IHRoZSBMU00gKi8KPj4gK307Cj4+ICsKPj4gwqAvKgo+PiDCoCAqIFNlY3VyaXR5IG1vZHVsZSBo
b29rIGxpc3Qgc3RydWN0dXJlLgo+PiDCoCAqIEZvciB1c2Ugd2l0aCBnZW5lcmljIGxpc3QgbWFj
cm9zIGZvciBjb21tb24gb3BlcmF0aW9ucy4KPj4gQEAgLTE2MDYsNyArMTYxMyw3IEBAIHN0cnVj
dCBzZWN1cml0eV9ob29rX2xpc3Qgewo+PiDCoAlzdHJ1Y3QgaGxpc3Rfbm9kZQkJbGlzdDsKPj4g
wqAJc3RydWN0IGhsaXN0X2hlYWQJCSpoZWFkOwo+PiDCoAl1bmlvbiBzZWN1cml0eV9saXN0X29w
dGlvbnMJaG9vazsKPj4gLQljb25zdCBjaGFyCQkJKmxzbTsKPj4gKwlzdHJ1Y3QgbHNtX2lkCQkJ
KmxzbWlkOwo+PiDCoH0gX19yYW5kb21pemVfbGF5b3V0Owo+PiDCoAo+PiDCoC8qCj4+IEBAIC0x
NjQxLDcgKzE2NDgsNyBAQCBleHRlcm4gc3RydWN0IHNlY3VyaXR5X2hvb2tfaGVhZHMgc2VjdXJp
dHlfaG9va19oZWFkczsKPj4gwqBleHRlcm4gY2hhciAqbHNtX25hbWVzOwo+PiDCoAo+PiDCoGV4
dGVybiB2b2lkIHNlY3VyaXR5X2FkZF9ob29rcyhzdHJ1Y3Qgc2VjdXJpdHlfaG9va19saXN0ICpo
b29rcywgaW50IGNvdW50LAo+PiAtCQkJCWNvbnN0IGNoYXIgKmxzbSk7Cj4+ICsJCQnCoMKgwqDC
oMKgwqAgc3RydWN0IGxzbV9pZCAqbHNtaWQpOwo+PiDCoAo+PiDCoCNkZWZpbmUgTFNNX0ZMQUdf
TEVHQUNZX01BSk9SCUJJVCgwKQo+PiDCoCNkZWZpbmUgTFNNX0ZMQUdfRVhDTFVTSVZFCUJJVCgx
KQo+PiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvYXBwYXJtb3IvbHNtLmMgYi9zZWN1cml0eS9hcHBh
cm1vci9sc20uYwo+PiBpbmRleCBlMjljYWRlN2I2NjIuLmI3MWY3ZDQxNTlkNyAxMDA2NDQKPj4g
LS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvbHNtLmMKPj4gKysrIGIvc2VjdXJpdHkvYXBwYXJtb3Iv
bHNtLmMKPj4gQEAgLTEyMDIsNiArMTIwMiwxMCBAQCBzdHJ1Y3QgbHNtX2Jsb2Jfc2l6ZXMgYXBw
YXJtb3JfYmxvYl9zaXplcyBfX2xzbV9yb19hZnRlcl9pbml0ID0gewo+PiDCoAkubGJzX3Rhc2sg
PSBzaXplb2Yoc3RydWN0IGFhX3Rhc2tfY3R4KSwKPj4gwqB9Owo+PiDCoAo+PiArc3RhdGljIHN0
cnVjdCBsc21faWQgYXBwYXJtb3JfbHNtaWQgX19sc21fcm9fYWZ0ZXJfaW5pdCA9IHsKPj4gKwku
bHNtwqDCoMKgwqDCoCA9ICJhcHBhcm1vciIsCj4+ICt9Owo+PiArCj4+IMKgc3RhdGljIHN0cnVj
dCBzZWN1cml0eV9ob29rX2xpc3QgYXBwYXJtb3JfaG9va3NbXSBfX2xzbV9yb19hZnRlcl9pbml0
ID0gewo+PiDCoAlMU01fSE9PS19JTklUKHB0cmFjZV9hY2Nlc3NfY2hlY2ssIGFwcGFybW9yX3B0
cmFjZV9hY2Nlc3NfY2hlY2spLAo+PiDCoAlMU01fSE9PS19JTklUKHB0cmFjZV90cmFjZW1lLCBh
cHBhcm1vcl9wdHJhY2VfdHJhY2VtZSksCj4+IEBAIC0xODk3LDcgKzE5MDEsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBhcHBhcm1vcl9pbml0KHZvaWQpCj4+IMKgCQlnb3RvIGJ1ZmZlcnNfb3V0Owo+
PiDCoAl9Cj4+IMKgCXNlY3VyaXR5X2FkZF9ob29rcyhhcHBhcm1vcl9ob29rcywgQVJSQVlfU0la
RShhcHBhcm1vcl9ob29rcyksCj4+IC0JCQkJImFwcGFybW9yIik7Cj4+ICsJCQkJJmFwcGFybW9y
X2xzbWlkKTsKPj4gwqAKPj4gwqAJLyogUmVwb3J0IHRoYXQgQXBwQXJtb3Igc3VjY2Vzc2Z1bGx5
IGluaXRpYWxpemVkICovCj4+IMKgCWFwcGFybW9yX2luaXRpYWxpemVkID0gMTsKPj4gZGlmZiAt
LWdpdCBhL3NlY3VyaXR5L2JwZi9ob29rcy5jIGIvc2VjdXJpdHkvYnBmL2hvb2tzLmMKPj4gaW5k
ZXggZTU5NzFmYTc0ZmQ3Li5lNTBkZTNhYmZkZTIgMTAwNjQ0Cj4+IC0tLSBhL3NlY3VyaXR5L2Jw
Zi9ob29rcy5jCj4+ICsrKyBiL3NlY3VyaXR5L2JwZi9ob29rcy5jCj4+IEBAIC0xNSw5ICsxNSwx
OCBAQCBzdGF0aWMgc3RydWN0IHNlY3VyaXR5X2hvb2tfbGlzdCBicGZfbHNtX2hvb2tzW10gX19s
c21fcm9fYWZ0ZXJfaW5pdCA9IHsKPj4gwqAJTFNNX0hPT0tfSU5JVCh0YXNrX2ZyZWUsIGJwZl90
YXNrX3N0b3JhZ2VfZnJlZSksCj4+IMKgfTsKPj4gwqAKPj4gKy8qCj4+ICsgKiBzbG90IGhhcyB0
byBiZSBMU01CTE9CX05FRURFRCBiZWNhdXNlIHNvbWUgb2YgdGhlIGhvb2tzCj4+ICsgKiBzdXBw
bGllZCBieSB0aGlzIG1vZHVsZSByZXF1aXJlIGEgc2xvdC4KPj4gKyAqLwo+PiArc3RydWN0IGxz
bV9pZCBicGZfbHNtaWQgX19sc21fcm9fYWZ0ZXJfaW5pdCA9IHsKPj4gKwkubHNtwqDCoMKgwqDC
oCA9ICJicGYiLAo+PiArfTsKPiBDYW4gYnBmX2xzbWlkIGJlIHN0YXRpYyB0b28/CgpZZXMuIFRo
YW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCj4KPj4gKwo+PiDCoHN0YXRpYyBpbnQgX19pbml0IGJw
Zl9sc21faW5pdCh2b2lkKQo+PiDCoHsKPj4gLQlzZWN1cml0eV9hZGRfaG9va3MoYnBmX2xzbV9o
b29rcywgQVJSQVlfU0laRShicGZfbHNtX2hvb2tzKSwgImJwZiIpOwo+PiArCXNlY3VyaXR5X2Fk
ZF9ob29rcyhicGZfbHNtX2hvb2tzLCBBUlJBWV9TSVpFKGJwZl9sc21faG9va3MpLAo+PiArCQkJ
wqDCoCAmYnBmX2xzbWlkKTsKPj4gwqAJcHJfaW5mbygiTFNNIHN1cHBvcnQgZm9yIGVCUEYgYWN0
aXZlXG4iKTsKPj4gwqAJcmV0dXJuIDA7Cj4+IMKgfQo+IFRoYW5rcwoKLS0KTGludXgtYXVkaXQg
bWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

