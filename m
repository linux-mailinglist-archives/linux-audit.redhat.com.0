Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFCB4521
	for <lists+linux-audit@lfdr.de>; Tue, 17 Sep 2019 03:08:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A7905AFE3;
	Tue, 17 Sep 2019 01:08:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474C55D6A9;
	Tue, 17 Sep 2019 01:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A77554E589;
	Tue, 17 Sep 2019 01:08:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8H18BJr029502 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 21:08:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA75D6013A; Tue, 17 Sep 2019 01:08:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FAB6012E;
	Tue, 17 Sep 2019 01:08:09 +0000 (UTC)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by mx1.redhat.com (Postfix) with ESMTP id 8E6AC3082E20;
	Tue, 17 Sep 2019 01:08:07 +0000 (UTC)
Received: from BC-Mail-Ex32.internal.baidu.com (unknown [172.31.51.26])
	by Forcepoint Email with ESMTPS id 6CDCC85C5BC83;
	Tue, 17 Sep 2019 09:08:03 +0800 (CST)
Received: from BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) by
	BC-Mail-Ex32.internal.baidu.com (172.31.51.26) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1713.5; Tue, 17 Sep 2019 09:08:04 +0800
Received: from BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) by
	BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) with mapi id
	15.01.1713.004; Tue, 17 Sep 2019 09:08:04 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Paul Moore <paul@paul-moore.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8g?=
	=?utf-8?Q?zero_when_audit_failed?=
Thread-Topic: [PATCH][RFC] audit: set wait time to zero when audit failed
Thread-Index: AQHVaWpIwZPuSgS+uUKlaAzCHP+Gd6ctnETAgADNj4CAAKk2MA==
Date: Tue, 17 Sep 2019 01:08:04 +0000
Message-ID: <fe43dc199f3949709828e1d96edf7556@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
In-Reply-To: <CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.198.8]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Tue, 17 Sep 2019 01:08:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 17 Sep 2019 01:08:08 +0000 (UTC) for IP:'220.181.3.85'
	DOMAIN:'mx21.baidu.com' HELO:'baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 220.181.3.85 mx21.baidu.com 220.181.3.85
	mx21.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8H18BJr029502
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 17 Sep 2019 01:08:34 +0000 (UTC)

Cgo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IFBhdWwgTW9vcmUgW21haWx0
bzpwYXVsQHBhdWwtbW9vcmUuY29tXQo+IOWPkemAgeaXtumXtDogMjAxOeW5tDnmnIgxN+aXpSA2
OjUyCj4g5pS25Lu25Lq6OiBMaSxSb25ncWluZyA8bGlyb25ncWluZ0BiYWlkdS5jb20+Cj4g5oqE
6YCBOiBFcmljIFBhcmlzIDxlcGFyaXNAcmVkaGF0LmNvbT47IGxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KPiDkuLvpopg6IFJlOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVy
byB3aGVuIGF1ZGl0IGZhaWxlZAo+IAo+IE9uIFN1biwgU2VwIDE1LCAyMDE5IGF0IDEwOjU1IFBN
IExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4gd3JvdGU6Cj4gPiA+ID4gaWYgYXVk
aXRfbG9nX3N0YXJ0IGZhaWxlZCBiZWNhdXNlIHF1ZXVlIGlzIGZ1bGwsIGthdWRpdGQgaXMKPiA+
ID4gPiB3YWl0aW5nIHRoZSByZWNlaXZpbmcgcXVldWUgZW1wdHksIGJ1dCBubyByZWNlaXZlciwg
YSB0YXNrIHdpbGwgYmUKPiA+ID4gPiBmb3JjZWQgdG8gd2FpdCA2MCBzZWNvbmRzIGZvciBlYWNo
IGF1ZGl0ZWQgc3lzY2FsbCwgYW5kIGl0IHdpbGwgYmUKPiA+ID4gPiBoYW5nIGZvciBhIHZlcnkg
bG9uZyB0aW1lCj4gPiA+ID4KPiA+ID4gPiBzbyBhdCB0aGlzIGNvbmRpdGlvbiwgc2V0IHRoZSB3
YWl0IHRpbWUgdG8gemVybyB0byByZWR1Y2Ugd2FpdCwKPiA+ID4gPiBhbmQgcmVzdG9yZSB3YWl0
IHRpbWUgd2hlbiBhdWRpdCB3b3JrcyBhZ2Fpbgo+ID4gPiA+Cj4gPiA+ID4gaXQgcGFydGlhbGx5
IHJlc3RvcmUgdGhlIGNvbW1pdCAzMTk3NTQyNDgyZGYgKCJhdWRpdDogcmV3b3JrCj4gPiA+ID4g
YXVkaXRfbG9nX3N0YXJ0KCkiKQo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGkgUm9u
Z1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5n
IFpoaUNoZW5nIDxsaWFuZ3poaWNoZW5nQGJhaWR1LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiBy
ZWJvb3QgaXMgdGFraW5nIGEgdmVyeSBsb25nIHRpbWUgb24gbXkgbWFjaGluZShjZW50b3MgNnU0
ICtrZXJuZWwKPiA+ID4gPiA1LjMpIHNpbmNlIFRJRl9TWVNDQUxMX0FVRElUIGlzIHNldCBieSBk
ZWZhdWx0LCBhbmQgd2hlbiByZWJvb3QsCj4gPiA+ID4gdXNlcnNwYWNlIHByb2Nlc3Mgd2hpY2gg
cmVjZWl2ZXIgYXVkaXQgbWVzc2FnZSAsIHdpbGwgYmUga2lsbGVkLAo+ID4gPiA+IGFuZCBsZWFk
IHRvIHRoYXQgbm8gdXNlciBkcmFpbiB0aGUgYXVkaXQgcXVldWUKPiA+ID4gPgo+ID4gPiA+IGdp
dCBiaXRzZWN0IHNob3cgaXQgaXMgY2F1c2VkIGJ5IDMxOTc1NDI0ODJkZiAoImF1ZGl0OiByZXdv
cmsKPiA+ID4gPiBhdWRpdF9sb2dfc3RhcnQoKSIpCj4gPiA+ID4KPiA+ID4gPiAga2VybmVsL2F1
ZGl0LmMgfCA5ICsrKysrKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBUaGlzIGlzIHR5cGljYWxseSBzb2x2ZWQg
YnkgaW5jcmVhc2luZyB0aGUgYmFja2xvZyB1c2luZyB0aGUKPiAiYXVkaXRfYmFja2xvZ19saW1p
dCIKPiA+ID4ga2VybmVsIHBhcmFtZXRlciAobGluayB0byB0aGUgZG9jcyBiZWxvdykuCj4gPgo+
ID4gSXQgc2hvdWxkIGJlIGFibGUgdG8gYXZvaWQgbXkgaXNzdWUsIGJ1dCB0aGUgZGVmYXVsdCBi
ZWhhdmlvcnMgZG9lcyBub3QKPiB3b3JraW5nIGZvciBtZTsgQW5kIG5vdCBhbGwgaGF2ZSBlbm91
Z2gga25vd2xlZGdlIGFib3V0IGF1ZGl0LCB3aG8gbWF5YmUKPiBzcGVuZCBsb3RzIG9mIGVmZm9y
dCB0byBmaW5kIHRoZSByb290IGNhdXNlLCBhbmQgZXN0aW1hdGUgaG93IGxhcmdlIHNob3VsZCBi
ZQo+ICJhdWRpdF9iYWNrbG9nX2xpbWl0Igo+IAo+IFRoZSBwYXVzZS9zbGVlcCBiZWhhdmlvciBp
cyBkZXNpcmVkIGJlaGF2aW9yIGFuZCBpcyBpbnRlbmRlZCB0byBoZWxwCj4ga2F1ZGl0ZC9hdWRp
dGQgcHJvY2VzcyB0aGUgYXVkaXQgYmFja2xvZyBvbiBhIGJ1c3kgc3lzdGVtLiAgSWYgd2UgZGlk
bid0IHNsZWVwCj4gdGhlIGN1cnJlbnQgcHJvY2VzcyBhbmQgZ2l2ZSBrYXVkaXRkL2F1ZGl0ZCBh
IGNoYW5jZSB0byBmbHVzaCB0aGUgYmFja2xvZyB3aGVuCj4gaXQgd2FzIGZ1bGwsIGEgbG90IG9m
IGJhZCB0aGluZ3MgY291bGQgaGFwcGVuIHdpdGggcmVzcGVjdCB0byBhdWRpdC4gIFdlCj4gZ2Vu
ZXJhbGx5IHNlbGVjdCB0aGUgYmFja2xvZyBsaW1pdCBzbyB0aGF0IHRoaXMgaXMgbm90IGEgcHJv
YmxlbSBmb3IgbW9zdCBzeXN0ZW1zLAo+IGFsdGhvdWdoIHRoZXJlIHdpbGwgYWx3YXlzIGJlIGVk
Z2UgY2FzZXMgd2hlcmUgdGhlIGRlZmF1bHQgZG9lcyBub3Qgd29yayB3ZWxsOwo+IGl0IGlzIGlt
cG9zc2libGUgdG8gcGljayBkZWZhdWx0cyB0aGF0IHdvcmsgd2VsbCBmb3IgZXZlcnkgY2FzZS4K
PiAKCkkganVzdCB3YW50IHRvIGl0IGFzIGJlZm9yZSAzMTk3NTQyNDgyZGYgKCJhdWRpdDogcmV3
b3JrIGF1ZGl0X2xvZ19zdGFydCgpIiksCndhaXQgNjAgc2Vjb25kcyBvbmNlIGlmIGF1ZGl0ZC9y
ZWFkYWhlYWFkLWNvbGxlY3RvciBoYXZlIHNvbWUgcHJvYmxlbSB0bwpkcmFpbiB0aGUgYXVkaXQg
YmFja2xvZy4KCkFuZCBvbmNlIHRoZSBhdWRpdGQvcmVhZGFoZWFkLWNvbGxlY3RvciByZWNvdmVy
cywgcmVzdG9yZSB0aGUgd2FpdCB0aW1lIHRvIDYwIHNlY29uZHMKCj4gSWYgeW91IGFyZSBub3Qg
dXNpbmcgYXVkaXQsIHlvdSBjYW4gYWx3YXlzIGRpc2FibGUgaXQgdmlhIHRoZSBrZXJuZWwgY29t
bWFuZCBsaW5lLAo+IG9yIGF0IHJ1bnRpbWUgKGxvb2sgYXQgd2hhdCBGZWRvcmEgZG9lcykuCj4g
Cj4gPiA+IFlvdSBtaWdodCBhbHNvIHdhbnQgdG8gaW52ZXN0aWdhdGUKPiA+ID4gd2hhdCBpcyBn
ZW5lcmF0aW5nIHNvbWUgbWFueSBhdWRpdCByZWNvcmRzIHByaW9yIHRvIHN0YXJ0aW5nIHRoZQo+
ID4gPiBhdWRpdCBkYWVtb24uCj4gPgo+ID4gSXQgaXMgL3NiaW4vcmVhZGFoZWFkLWNvbGxlY3Rv
ciwgaW4gZmFjdCwgd2Ugc3RvcCB0aGUgYXVkaXRkOyBXZSBhcmUgZG9pbmcgYQo+IHJlYm9vdCB0
ZXN0LCB3aGljaCByZWJvb3RpbmcgbWFjaGluZSBjb250aW51ZSB0byB0ZXN0IGhhcmR3YXJlL3Nv
ZnR3YXJlLgo+ID4KPiA+IGl0IGlzIHNhbWUgYXMgYmVsb3c6Cj4gPiBhdWRpdGN0bCAtYSBhbHdh
eXMsZXhpdCAtUyBhbGwgLUYgcGlkPSd4eHgnCj4gPiBraWxsIC1zIDE5IGBwaWRvZiBhdWRpdGRg
Cj4gPgo+ID4gdGhlbiB0aGUgYXVkaXRlZCB0YXNrIHdpbGwgYmUgaHVuZwo+IAo+IFNvIHlvdSBh
cmUgc2VlaW5nIHRoaXMgcHJvYmxlbSBvbmx5IHdoZW4geW91IHJ1biBhIHRlc3QsIG9yIGRpZCB5
b3UgcHJvdmlkZSB0aGlzCj4gYXMgYSByZXByb2R1Y2VyPwo+IAoKYXVkaXRjdGwgLWEgYWx3YXlz
LGV4aXQgLVMgYWxsIC1GIHBwaWQ9YHBpZG9mIHNzaGRgCmtpbGwgLXMgMTkgYHBpZG9mIGF1ZGl0
ZGAKc3NoIHJvb3RAMTI3LjAuMC4xIAoKdGhlbiBzc2ggd2lsbCBiZSBodW5nIGZvcmV2ZXIKCi1M
aSBSb25nUWluZwoKPiAtLQo+IHBhdWwgbW9vcmUKPiB3d3cucGF1bC1tb29yZS5jb20KCi0tCkxp
bnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==
